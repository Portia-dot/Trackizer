import SwiftUI

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.leading, 15)
    }
}

#Preview {
    SectionHeaderView(title: "General")
        .background(Color.black) // Use this to preview the text color contrast
}
