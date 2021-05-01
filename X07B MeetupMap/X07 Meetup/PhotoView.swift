//
//  PhotoView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 01/05/2021.
//

import SwiftUI

struct PhotoView: View {
    @Binding var image: Image?
    @Binding var showingImagePicker: Bool
    let photoFile: String

    @State private var inputImage: UIImage?

    var body: some View {
        Section(header: Text("").accessibility(hidden: true)) {
            ZStack(alignment: .bottomTrailing) {
                Rectangle()
                    .fill(Color.secondary.opacity(0.3))
                    .frame(maxHeight: 200)
                    .clipShape(Circle())

                VStack {
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 200, minHeight: 200)
                            .clipShape(Circle())

                    } else {
                        Text("Tap to select a photo")
                            .frame(maxWidth: 150, maxHeight: 150)
                            .lineLimit(3)
                            .foregroundColor(.white)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(10)
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)

                if image != nil {
                    CircleButtonView(imageName: "photo")
                        .accessibility(label: Text("Change photo"))
                }
            }
            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .onTapGesture {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            handleImage()
        }) {
            ImagePicker(image: self.$inputImage)
        }
    }

    func handleImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)

        let imageSaver = ImageManager()
        imageSaver.writeToFile(photoFile: photoFile, image: inputImage)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        let image = Image(systemName: "questionmark.square.fill")

        PhotoView(image: .constant(image), showingImagePicker: .constant(false), photoFile: UUID().uuidString)
    }
}
