//
//  LoginViewController.swift
//  Be Healthy Santander
//
//  Created by Flex Administrador on 5/11/17.
//  Copyright © 2017 Flex Administrador. All rights reserved.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cliqueFora: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(cliqueFora)
        
        buttonLogin.layer.cornerRadius = 10
        
        let usuarioo = Auth.auth()
        
        usuarioo.signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (usuarioo, erro) in
            if erro == nil {
                
                print ("Sucesso ao logar usuario!")
                
            }else{
                print ("Erro ao logar usuário! \(String(describing: erro?.localizedDescription))")
                
            }
        }
        
        
        
        usuarioo.addStateDidChangeListener { (autenticacao, usuario) in
            if let usuarioLogado = usuario {
                print("usuario esta logado" + String(describing: usuarioLogado.email))
            }else{
                print ("usuario nao está logado!")
                
            }
        }
    }
    
    func dismissKeyboard(){
        //textField.resignFirstResponder()
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
