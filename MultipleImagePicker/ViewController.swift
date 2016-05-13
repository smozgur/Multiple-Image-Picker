//
//  ViewController.swift
//  ImagePicker
//
//  Created by Suat Ozgur on 5/13/16.
//  Copyright © 2016 BatCoder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func picker(sender: UIBarButtonItem) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .SavedPhotosAlbum
        
        switch sender.tag {
        case 2:
            self.imageView = picture2
        case 3:
            self.imageView = picture3
        default:
            self.imageView = picture1
        }
        
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var picture1: UIImageView!
    @IBOutlet weak var picture2: UIImageView!
    @IBOutlet weak var picture3: UIImageView!

    var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker.delegate = self
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.contentMode = .ScaleAspectFit
            self.imageView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}

