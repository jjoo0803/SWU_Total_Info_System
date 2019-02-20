import UIKit

class SubjectListViewController: UIViewController {

    // MARK:- IBOulet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Properties
    var subjects: [SubjectListResponse.Response]?
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveSubjectNotification(_:)), name: DidReceiveSubjectNotification, object: nil)
    }
    
    // MARK:- Function
    @objc func didReceiveSubjectNotification(_ noti: Notification) {
        guard let subjects: [SubjectListResponse.Response] = noti.userInfo?["subject"] as? [SubjectListResponse.Response] else { return }
        self.subjects = subjects
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }

    @IBAction func touchUpCancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
     //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC: LectureMaterialListViewController = segue.destination as? LectureMaterialListViewController else { return }
        guard let cell = self.tableView.indexPathForSelectedRow else { return }
        guard let subjectTitle: SubjectListResponse.Response = self.subjects?[cell.row] else { return }
        nextVC.title = subjectTitle.name
    }
}



// MARK:- DataSource
extension SubjectListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath) as? SubjectListTableViewCell else { return UITableViewCell() }
        guard let subject: SubjectListResponse.Response = self.subjects?[indexPath.row] else { return UITableViewCell() }
        cell.SubjectTitleLabel.text = subject.name
        return cell
    }
    
}
