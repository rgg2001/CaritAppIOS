//
//  ViewController.swift
//  CaritAppLogin
//
//  Created by Alumno on 06/09/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfUsuario: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var indicatorLogin: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLogIn(_ sender: Any) {
        indicatorLogin.startAnimating()
        btnLogin.isSelected = true
        
        if tfUsuario.text == "user" && tfPassword.text == "123"{
            delay(2, closure: { () -> () in
                self.indicatorLogin.stopAnimating()
                self.btnLogin.isSelected = false
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
        }else{
            delay(2, closure: { () -> () in
                self.indicatorLogin.stopAnimating()
                self.btnLogin.isSelected = false
                // Pop Up Alerta
                let alerta = UIAlertController(title: "Usuario o Contraseña Incorrecta", message: "Favor de insertar los valores correctos", preferredStyle: .alert)
                let botonCancel = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alerta.addAction(botonCancel)
                self.present(alerta, animated: true)
            })
            
        }
    }
    

}

