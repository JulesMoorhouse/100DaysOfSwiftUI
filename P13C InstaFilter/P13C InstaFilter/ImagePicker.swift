//
//  ImagePicker.swift
//  P13C InstaFilter
//
//  Created by Julian Moorhouse on 09/04/2021.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //
    }
        
    typealias UIViewControllerType = UIImagePickerController
    
}
