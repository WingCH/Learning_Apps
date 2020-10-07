final class SettingsController: UIViewController, SettingsView {
    
    //controller handler
    var onLogout: (() -> Void)?
    var onItemSelect: ((Int) -> ())?
    
    @IBOutlet weak var tableView: UITableView!
    //mock datasource
    var settings: [[Setting]] = [[]]
    
    @IBAction func logoutButtonClicked(_ sender: UIBarButtonItem) { onLogout?() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .stop,
            target: self,
            action: #selector(SettingsController.logoutButtonClicked(_:))
        )
        
        makeMockData()
    }
    
    func makeMockData() {
        
        let settings1 = (0...3).map { index in return Setting(title: "Setting № \(index)", subtitle: "Setting descripton") }
        let settings2 = (0...5).map { index in return Setting(title: "Setting № \(index)", subtitle: "Setting descripton") }
        settings.append(settings1)
        settings.append(settings2)
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.onItemSelect?(indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let setting = settings[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row]
        cell.textLabel?.text = setting.title
        cell.detailTextLabel?.text = setting.subtitle
        return cell
    }
}
