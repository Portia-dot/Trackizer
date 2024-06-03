//
//  ProfileImageSelector.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-23.
//

import SwiftUI

struct ProfileImageSelector: View {
    @State private var showImagePicker = false
    @Binding  var imageSelected: UIImage?
    @State private var profileImage: Image?
    var body: some View {
        VStack{
            Button{
                showImagePicker.toggle()
            }label: {
                ZStack{
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundStyle(Color(.systemGray))
                        .frame(width: 140, height: 140)
                    
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color(.systemGray))
                            .clipShape(Circle())
                    }else{
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.gray)
                        
                        Text("Profile Picture")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .offset(y: 30)
                    }
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $imageSelected)
            }
        }
    }
    func loadImage() {
        guard let imageSelected = imageSelected else {return}
        profileImage = Image(uiImage: imageSelected)
    }
}

//#Preview {
//    @State var selectedImage: UIImage? = nil
//    ProfileImageSelector(imageSelected: $selectedImage)
//        .preferredColorScheme(.dark)
//}
