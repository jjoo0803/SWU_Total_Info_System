//
//  ViewController.swift
//  SWUTotalInfoSystem
//
//  Created by 박주현 on 29/01/2019.
//  Copyright © 2019 박주현. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet var IdTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func touchUpLoginButton(_ sender: UIButton) {
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
//        let content = ""
//        let jsonData = try? encoder.encode(content)
//        if let jsonData = jsonData, let jsonString = String(data: jsonData, encoding: .utf8) {
//            print(jsonString)
//            postAction(uid: IdTextField.text ?? "", upw: PasswordTextField.text ?? "")
//            // 로그인 제대로 했는지 구현해야됨
//            self.dismiss(animated: true, completion: nil)
//        }
        
        let parameters:[String:Any] = [
            
            "value" : "BAHByanLHlqzhkRmAd70hprj6d9EOSwoLftRgheYtC21AbiTUmWKW95te5u8ni6l.LMSWAS2_servlet_engine1",
            "drive_id" : 1
            
        ]
        Alamofire.request("http://172.20.10.5:8090/getSubjectList", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                
                return .success
            }
            .responseJSON { response in
               
                switch response.result {
                //성공일 때
                case .success( _):
                     debugPrint(response)
                    
                //실패했을 시
                case .failure(_):
                    debugPrint(response)
                    
                }
        }
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

