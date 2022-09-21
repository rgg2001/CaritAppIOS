//
//  MyProjectsViewController.swift
//  CaritAppLogin
//
//  Created by Alberto Estrada on 07/09/22.
//

import UIKit

class MyProjectsViewController: UIViewController {

    
    @IBOutlet weak var displayCodeView: UIImageView!
    
    var filter:CIFilter!
    
    let texto = "user123@gmail.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let data = texto.data(using: .ascii, allowLossyConversion: false)
                    
        filter = CIFilter(name: "CIQRCodeGenerator")
                    
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let imagen = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
                    
        displayCodeView.image = imagen
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
