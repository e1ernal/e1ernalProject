//
//  ViewController.swift
//  Manuscript
//
//  Created by DMITRY on 28/02/2020.
//  Copyright © 2020 Dmitry Smirnykh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var portrait: UIImageView!
    @IBOutlet weak var addPhotoIcon: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPhotoIcon.layer.cornerRadius = addPhotoIcon.bounds.height / 2
        portrait.layer.cornerRadius = addPhotoIcon.bounds.height / 2
        editButton.layer.cornerRadius = editButton.bounds.height / 3
        editButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        editButton.layer.borderWidth = 3.0
        editButton.clipsToBounds = true
        
        print("DidLoad editButton.frame = \(editButton.frame)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("DidAppear editButton.frame = \(editButton.frame)")
        //Хз
    }
    
    @IBAction func addPhotoIcon(_ sender: Any) {
        
        print("Выберите изображение профиля")
        
        let alert:UIAlertController = UIAlertController(title: "Фото профиля", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Сделать снимок", style: UIAlertAction.Style.default) {
                UIAlertAction in
            self.openCamera()
        }
        let gallaryAction = UIAlertAction(title: "Выбрать фотографию", style: UIAlertAction.Style.default) {
                UIAlertAction in
            self.openGallary()
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        // Add the actions
        picker.delegate = self
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera() {
        picker.sourceType = .camera
        picker.allowsEditing = true
        self.present(picker, animated: true, completion: nil)
    }
    func openGallary() {
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
}

extension ViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                portrait.image = image
            }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Picker cancel")
    }
}
