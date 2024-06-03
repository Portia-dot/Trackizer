import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
                NavigationStack{
                    if authViewModel.userSession == nil{
                        OpenScreen()
                    }else{
                        MainTabView()
                        
                    }
                }
        .alert("Logged Out", isPresented: $authViewModel.showLogOutAlert) {
            Button("Ok", role: .cancel) {
                authViewModel.showLogOutAlert = false
            }
        } message: {
            Text("You have been logged out because your account no longer exists")
        }
        .onChange(of: authViewModel.userSession, initial: false){
            handleSessionChange()
        }
        .onAppear {
            print("ContentView appeared, userSession: \(String(describing: authViewModel.userSession))")
        }
    }
    private func handleSessionChange(){
        if authViewModel.userSession == nil {
            print("No Active User Session")
        }else {
            print("User Session Is Dectected")
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
            .environmentObject(NavigationManager())
    }
}

