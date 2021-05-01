//
//  PhotoView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 01/05/2021.
//

import SwiftUI

struct PhotoView: View {
    let image: Image?
    @Binding var showingImagePicker: Bool

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
                    Group {
                        Circle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(width: 40, height: 40)

                        Button(action: {
                            //
                        }) {
                            Image(systemName: "photo")
                                .frame(width: 40, height: 40)
                        }
                        .accessibility(hidden: true)
                    }
                    .accessibility(label: Text("Change photo"))
                }
            }
            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .onTapGesture {
                self.showingImagePicker = true
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        let image = Image(systemName: "questionmark.square.fill")

        PhotoView(image: image, showingImagePicker: .constant(false))
    }
}
