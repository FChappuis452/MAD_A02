/*
 * Project          :   MAD Assignment 02
 * File             :   MainViewController.swift
 * Programmer       :   Frederic Chappuis, Lucas Roes, TJ Cowen
 * First Version    :   September 2019
 * Description      :   This is the main controller view for the application.  Upon
 *                      application start it will default to this view
 */


import UIKit

class MainViewController: UIViewController {

    /*
     * Function     :   viewUnityConverter
     * Description  :   This is the function that controls going to the Unit converter screen
     *                  It calls a the goToView function to call the Unit conversion screen.
     * Parameters   :   none
     * Return Value :   none
     */
    @IBAction func viewUnitConverter(_ sender: Any) {
        self.goToView(name: "SecondViewController")
    }
    
    
    
    /*
     * Function     :   viewThirdScreen
     * Description  :   This is the function that controls going to the third view screen
     *                  It calls a the goToView function to call the third view screen.
     * Parameters   :   none
     * Return Value :   none
     */
    @IBAction func viewTaskScreen(_ sender: Any) {
        self.goToView(name: "ThirdViewController")
    }
    
    
    
    
    // Base Class method added by iOS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Base Class method added by iOS
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can ve recreated
    }
    
    
    
    
    /*
     * Function     :   goToView
     * Description  :   This uses the view controller to help navigate between the views
     * Parameters   :   String: the name of the View Controller Storyboard ID
     * Return Value :   none
     */
    func goToView(name: String){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

