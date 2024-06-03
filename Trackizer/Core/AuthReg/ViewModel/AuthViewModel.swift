//
//  AuthViewModel.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isLoading = false
    @Published var showLogOutAlert = false
    @Published var shouldNavigateToMain = false
    
    var tempSession: FirebaseAuth.User?
    var profileCompletionRequired: Bool = true  

    init() {
        self.userSession = Auth.auth().currentUser
        self.verifySession()
    }
    
    func verifySession() {
        if let currentUser = Auth.auth().currentUser {
            let db = Firestore.firestore()
            db.collection("users").document(currentUser.uid).getDocument { document, error in
                if let document = document, document.exists {
                    self.userSession = currentUser
                } else {
                    self.logout()
                    self.showLogOutAlert = true
                }
            }
        } else {
            self.userSession = nil
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.showLogOutAlert = true
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
    
    func login(withEmail email: String, password: String) {
            isLoading = true
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    if let user = result?.user, error == nil {
                        self?.userSession = user
                        self?.shouldNavigateToMain = true  // Set this to true on successful login
                    } else {
                        print("Error logging in: \(error?.localizedDescription ?? "Unknown error")")
                    }
                }
            }
        }

    func registerUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            self.isLoading = false
            if let error = error {
                print("Failed to register with error: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let user = result?.user else {
                completion(false)
                return
            }
            let data = ["email": email, "uid": user.uid]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print("Failed to upload user data: \(error.localizedDescription)")
                    completion(false)
                } else {
                    print("User data uploaded to Firestore, awaiting profile completion")
                    self.tempSession = user  // Store user temporarily
                    self.profileCompletionRequired = true
                    completion(true)
                }
            }
        }
    }

    
    func finalizeProfileCompletion() {
        if !profileCompletionRequired {
            userSession = tempSession  // Finalize the session
            tempSession = nil
            profileCompletionRequired = false
        }
    }
    
    
    

//    private func fetchUser(){
//        guard let uid = userSession?.uid else {return}
//        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
//            if let error = error {
//                print ("Error fetching user:\(error.localizedDescription)")
//                return
//            }
//            guard let data = snapshot?.data() else { return }
//            self.fullName = data["fullName"] as? String ?? ""
//            self.age = data["age"] as? String ?? ""
//            self.country = data["country"] as? String ?? ""
//            self.bank = data["bank"] as? String ?? ""
//            self.username = data["username"] as? String ?? ""
//        }
//    }
}
