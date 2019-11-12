/*
 * Project          :   MAD Assignment 02
 * File             :   MainViewController.swift
 * Programmer       :   Frederic Chappuis, Lucas Roes, TJ Cowen
 * First Version    :   November 2019
 * Description      :   This is the main controller view for the application.  Upon
 *                      application start it will default to this view
 */

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    private var data: [String] = []
    
    // Base Class method added by iOS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...100{
            data.append("\(i)")
        }
        tableView.dataSource = self
    }
    
    // Base Class method added by iOS
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can ve recreated
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReUseID")!
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
}
