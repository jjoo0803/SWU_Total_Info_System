//
//  NoticeListViewController.swift
//  SWUTotalInfoSystem
//
//  Created by 박주현 on 29/01/2019.
//  Copyright © 2019 박주현. All rights reserved.
//

import UIKit

class NoticeListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    // MARK:- Properties
    let cell = "NoticeCell"
    var notice: [NoticeResponse.Response]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveNoticeNotification(_:)), name: DidReceiveNoticeNotification, object: nil)
    }
    
    @objc func didReceiveNoticeNotification(_ noti: Notification) {
        guard let notice: [NoticeResponse.Response] = noti.userInfo?["notice"] as? [NoticeResponse.Response] else { return }
        self.notice = notice
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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

// MARK:- DataSource
extension NoticeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notice?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? NoticeListTableViewCell else { return UITableViewCell() }
        guard let notice = self.notice else { return UITableViewCell() }
        return cell
    }
}
