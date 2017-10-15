
import UIKit


struct accountKey  {
  
  static let bankData = "BankData"
  static let nameData = "NameData"
  static let accountData = "AccountData"
  
}

class MainVC: UIViewController {
    
 lazy  var bankData = [String]()
 lazy  var nameData = [String]()
 lazy  var accountData = [String]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
       tableView.tableFooterView = UIView()
    
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    retrieveData()
    tableView.reloadData()
    
  }
  // 저장을 하거나 수정을 했을 때 테이블뷰로 다시 돌아오면 테이블을 새로고침 (정보가 수정되어 보임)
    
    func retrieveData()  {
    
    if  let safeBankData = UserDefaults.standard.object(forKey: accountKey.bankData) as? [String] {
      self.bankData = safeBankData
    }
    if let safeNameData = UserDefaults.standard.object(forKey: accountKey.nameData) as? [String]  {
      self.nameData = safeNameData
    }
    if let safeAccountData = UserDefaults.standard.object(forKey: accountKey.accountData) as? [String] {
      self.accountData = safeAccountData
    }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MainVC:UITableViewDataSource,UITableViewDelegate  {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bankData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!MainCell
    cell.bankLabel.text = bankData[indexPath.row]
    cell.nameLabel.text = nameData[indexPath.row]
    cell.accountLabel.text = accountData[indexPath.row]
    
    return cell
    
  }
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   performSegue(withIdentifier: "mainToRecord", sender: indexPath)
  }
  //table view 설정
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "mainToRecord"  {
      
      let indexPath = sender as! IndexPath
      let recordVC = segue.destination as! RecordVC
    
      recordVC.bankInfo = bankData[indexPath.row]
      recordVC.nameInfo = nameData[indexPath.row]
      recordVC.accountInfo = accountData[indexPath.row]
      
    }
  }
}

