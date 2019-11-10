/*
 * Project          :   MAD Assignment 01
 * File             :   ThirdViewController.swift
 * Programmer       :   Frederic Chappuis, Lucas Roes, TJ Cowen
 * First Version    :   September 2019
 * Description      :   This is the third controller view for the application.  Upon
 *                      pressing the work crew button on the main screen it will activate
 *                      this screen.
 *
 *                      This view is mostly none functional with code
 */

import UIKit
class WorkGroupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var switch1: UISwitch!
    @IBOutlet var picker1: UIPickerView!
    @IBOutlet var picker2: UIPickerView!
    
    // The information to display in the pickerview
    let pickerData = ["1", "2", "3", "4"]

    
    // Class method added by iOS
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // There was an issue with dismissing the keyboard with dismissFirstResponder so I
        // found this alternate method from stack overflow
        // https://stackoverflow.com/questions/37229132/swift-how-to-resign-first-responder-on-all-uitextfield
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    
    
    // Class method added by iOS
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can ve recreated
    }
    
    
    
    
    
    /*
     * Function     :   @objc hideKeyboard
     * Description  :   This the second part of hiding the keyboard when someone taps outside a textfield.  It also uses
     *                  Objective C to run this bit of code which is why the decorate @objc before the function
     *                  https://stackoverflow.com/questions/37229132/swift-how-to-resign-first-responder-on-all-uitextfield
     * Parameters   :   none
     * Return Value :   none
     */
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    
    
    
    
    /*
     * Function     :   multiple
     * Description  :   The following three function are needed to populate the picker views on the screen
     *                  numberOfComponents returns how many different sets of data in the picker views
     *                  titleForRow returns the String value in the pickerdata array
     *                  numberOfRows returns the amount of rows to place in the pickerview
     * Parameters   :   none
     * Return Value :   none
     */    // https://www.youtube.com/watch?v=tGr7qsKGkzY
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String?{
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count
    }
    
}
