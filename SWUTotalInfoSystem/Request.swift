import Foundation
import UIKit
import Alamofire

let DidReceiveSubjectNotification: Notification.Name = Notification.Name("DidReceiveSubject")
let DidReceiveNoticeNotification: Notification.Name = Notification.Name("DidReceiveNotice")

// 로그인
func postAction(uid: String, upw: String) {
    let url = String("")     // url
    guard let serviceUrl = URL(string: url) else { return }
    let parameterDictionary = ["uid" : uid, "upw" : upw ] as [String : Any]
    var request = URLRequest(url: serviceUrl)
    request.httpMethod = "POST"
    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else { return }
    request.httpBody = httpBody
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
        if let response = response {
            print(response)
        }
        if let data = data {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print("----------error----------")
                print(error)
            }
        }
        }.resume()
}

// 강의 목룍 요청
func requestSubject(id: String){
    
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
            case .failure(_):
                debugPrint(response)
                
            }
    }
    
//    let url = String("http://172.20.10.5:8090/getSubjectList") // 접속 url
//    guard let serviceUrl = URL(string: url) else { return }
//    let parameterDictionary = ["value" : "BAHByanLHlqzhkRmAd70hprj6d9EOSwoLftRgheYtC21AbiTUmWKW95te5u8ni6l.LMSWAS2_servlet_engine1", "drive_id" : "1" ] as [String : Any]
//
//    var request = URLRequest(url: serviceUrl)
//    request.httpMethod = "POST"
//    request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else { return }
//    request.httpBody = httpBody
//
//    let session: URLSession = URLSession(configuration: .default)
//
//    let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, respone, error) in
//        if let error = error {
//            NotificationCenter.default.post(name: DidReceiveSubjectNotification, object: nil, userInfo: ["Error" : error.localizedDescription])
//            print(error.localizedDescription)
//        }
//        guard let data = data else { return }
//        do {
//            let subject: SubjectListResponse = try JSONDecoder().decode(SubjectListResponse.self, from: data)
//            NotificationCenter.default.post(name: DidReceiveSubjectNotification, object: nil, userInfo: ["subject" : subject])
//        } catch (let error) {
//            NotificationCenter.default.post(name: DidReceiveSubjectNotification, object: nil, userInfo: ["Error" : error.localizedDescription])
//            print(error.localizedDescription)
//        }
//    }
//    dataTask.resume()
    
    
}

func requestNotice(id: String) {
    let url = String("") // 접속 url
    guard let serviceURL = URL(string: url) else { return }
    let session: URLSession = URLSession(configuration: .default)
    let dataTask: URLSessionDataTask = session.dataTask(with: serviceURL) { (data, repone, error) in
        if let error = error {
            NotificationCenter.default.post(name: DidReceiveNoticeNotification, object: nil, userInfo: ["Error" : error.localizedDescription])
            print(error.localizedDescription)
        }
        guard let data = data else { return }
        do {
            let notice: NoticeResponse = try JSONDecoder().decode(NoticeResponse.self, from: data)
            NotificationCenter.default.post(name: DidReceiveNoticeNotification, object: nil, userInfo: ["notice" : notice])
        } catch (let error) {
            NotificationCenter.default.post(name: DidReceiveNoticeNotification, object: nil, userInfo: ["Error" : error.localizedDescription])
            print(error.localizedDescription)
        }
    }
    dataTask.resume()
}
