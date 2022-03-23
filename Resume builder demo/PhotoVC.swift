//
//  PhotoVC.swift
//  Resume builder demo
//
//  Created by Md. Mehedi Hasan on 5/3/22.
//

import UIKit
import Photos
import PhotosUI

class PhotoVC: UIViewController, PHPickerViewControllerDelegate {
   

    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnselectPhoto: UIButton!
    @IBOutlet weak var imageview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIinit()
    }
    func UIinit(){
        self.view.backgroundColor = UIColor.white
        self.imageview.backgroundColor = .systemGray4
        self.imageview.image = CurrentResume.shared.image
        
    }
    
    
    @IBAction func selectPhotoClicked(_ sender: Any) {
        
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.selectionLimit = 1
        config.filter = .images
        let vc = PHPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
        
        
    }
    
    @IBAction func reviewclicked(_ sender: Any) {
        
        performSegue(withIdentifier: "photoToReview", sender: self)
    }
    
    
    
    
    
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true )
        
        results.forEach { result in
            
                result.itemProvider.loadObject(ofClass: UIImage.self ) { reading , error in
                    
                    guard let image = reading as? UIImage, error == nil else{
                        return
                    }
                    DispatchQueue.main.async {
                        self.imageview.image = image
                        CurrentResume.shared.image = image 
                    }
                    
                }
                
            }
             
        }
    }
    


