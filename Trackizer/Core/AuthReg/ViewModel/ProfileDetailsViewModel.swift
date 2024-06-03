//
//  ProfileDetailsViewModel.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-23.
//

import Foundation
import Firebase
import FirebaseStorage

class ProfileDetailsViewModel: ObservableObject {
    @Published  var fullName: String = ""
    @Published  var age: String = ""
    @Published var country: String = ""
    @Published var bank : String = ""
    @Published  var username : String = ""
    @Published var profileImage: UIImage? = nil
    @Published var isLoading: Bool = false
    
    @Published var userSession: FirebaseAuth.User?
    private var tempUserSession: FirebaseAuth.User?
    
    func uploadProfileImage(_ image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        guard let uid = tempUserSession?.uid else {
            print("No user session available")
            completion(.failure(NSError(domain: "ProfileDetails", code: 0, userInfo: [NSLocalizedDescriptionKey: "No user session available"])))
            return
        }

        ImageUploader.uploadImage(image: image) { result in
            switch result {
            case .success(let profileImageUrl):
                Firestore.firestore().collection("users").document(uid).updateData(["profileImage" : profileImageUrl]) { error in
                    if let error = error {
                        print("Failed to update Firestore with profile image URL: \(error.localizedDescription)")
                        completion(.failure(error))
                    } else {
                        print("Successfully updated Firestore with profile image URL")
                        completion(.success(profileImageUrl))
                    }
                }
            case .failure(let error):
                print("Failed to upload image: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }

    func saveProfileDetails(completion: @escaping (Bool) -> Void) {
        guard let user = Auth.auth().currentUser else {
            print("No current user found")
            completion(false)
            return
        }

        tempUserSession = user
        isLoading = true

        if let image = profileImage {
            uploadProfileImage(image) { result in
                switch result {
                case .success(let profileImageUrl):
                    print("Successfully uploaded profile image, URL: \(profileImageUrl)")
                    self.saveDetails(profileImageUrl: profileImageUrl, completion: completion)
                case .failure(let error):
                    print("Failed to upload profile image: \(error.localizedDescription)")
                    self.isLoading = false
                    completion(false)
                }
            }
        } else {
            print("No profile image to upload")
            self.saveDetails(profileImageUrl: nil, completion: completion)
        }
    }



    func saveDetails(profileImageUrl: String?, completion: @escaping (Bool) -> Void) {
        guard let user = tempUserSession else {
            isLoading = false
            completion(false)
            return
        }

        var data: [String: Any] = [
            "fullName": self.fullName,
            "age": self.age,
            "country": self.country,
            "bank": self.bank,
            "username": self.username,
            "email": user.email ?? ""
        ]
        if let profileImageUrl = profileImageUrl {
            data["profileImageUrl"] = profileImageUrl
        }

        Firestore.firestore().collection("users").document(user.uid).setData(data, merge: true) { error in
            self.isLoading = false
            if let error = error {
                print("Failed to save profile: \(error.localizedDescription)")
                completion(false)
            } else {
                self.userSession = self.tempUserSession
                self.fetchUser()
                completion(true)
            }
        }
    }

    

    private func fetchUser(){
        guard let uid = userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print ("Error fetching user:\(error.localizedDescription)")
                return
            }
            guard let data = snapshot?.data() else { return }
            self.fullName = data["fullName"] as? String ?? ""
            self.age = data["age"] as? String ?? ""
            self.country = data["country"] as? String ?? ""
            self.bank = data["bank"] as? String ?? ""
            self.username = data["username"] as? String ?? ""
        }
    }
}

