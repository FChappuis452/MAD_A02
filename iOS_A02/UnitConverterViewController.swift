/*
 * Project          :   MAD Assignment 02
 * File             :   SecondViewController.swift
 * Programmer       :   Frederic Chappuis, Lucas Roes, TJ Cowen
 * First Version    :   September 2019
 * Description      :   This is the second controller view for the application.  Upon
 *                      pressing the unit converter button on the main screen it will activate
 *                      this screen.
 *
 *                      This view contains two buttons one to convert Celcius to Fahrenheit and vice versa
 *                      and one to convert Centimetres to inches and vice versa
 */

import UIKit
class UnitConverterViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets for the various Labels and textfields and input views
    // on screens
    @IBOutlet var inputsView: UIView!
    @IBOutlet var resultsView: UIView!
    @IBOutlet var txtFieldA: UITextField!
    @IBOutlet var txtFieldB: UITextField!
    @IBOutlet var lblA: UILabel!
    @IBOutlet var lblB: UILabel!
    @IBOutlet var lblOP: UILabel!
    @IBOutlet var lblResult: UILabel!
    
    
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
     * Function     :   ClearB
     * Description  :   This will clear textfield labelled txtFieldB which will trigger
     *                  when someone inputs in the txtFieldA
     * Parameters   :   none
     * Return Value :   none
     */
    @IBAction func ClearB(_ sender: Any) {
        txtFieldB.text = ""
    }
    
    
    
    
    
    /*
     * Function     :   ClearA
     * Description  :   This will clear textfield labelled txtFieldA which will trigger
     *                  when someone inputs in the txtFieldB
     * Parameters   :   none
     * Return Value :   none
     */
    @IBAction func clearA(_ sender: Any) {
        txtFieldA.text = ""
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
     * Function     :   convertTemp
     * Description  :   The actions that will happen once the Temperature button is pressed
     *                  it will unhide the inputView (Stacked view) and fill the label for
     *                  correct input.  It also fills in a hidden label with the operation
     *                  to be made
     * Parameters   :   none
     * Return Value :   none
     */
    @IBOutlet weak var tempButton: UIButton!
    @IBAction func convertTemp(_ sender: Any) {
        inputsView.isHidden = false
        lblA.text = "Celcius"
        lblB.text = "Fahrenheit"
        lblOP.text = "temp"
       
    }
    
   
    
    
    
    /*
     * Function     :   convertCmToIn
     * Description  :   The actions that will happen once the "CM <-> IN" button is pressed
     *                  it will unhide the inputView (Stacked view) and fill the label for
     *                  correct input.  It also fills in a hidden label with the operation
     *                  to be made
     * Parameters   :   none
     * Return Value :   none
     */
    @IBOutlet var cm_in: UIButton!
    @IBAction func convertCmToIn(_ sender: Any) {
        inputsView.isHidden = false
        lblA.text = "Centimetres"
        lblB.text = "Inches"
        lblOP.text = "cm_in"
    }
    
    
    
    
    
    
    /*
     * Function     :   convert
     * Description  :   This runs the action conversion. It will take the value along with the unit to be
     *                  converted to and return a String result
     * Parameters   :   Double: the number to be converted
     *                  String: the unit to convert to ie "c" to convert to Celcius
     * Return Value :   String: The result of the conversion in string format
     */
    func convert(_ value:Double, _ unit:String) -> String {
        var result:String = ""
        var r:Double = 0.0
        
        // This switct runs which conversion math to run base on the unit:String given
        switch unit{
        case "cel": // Celcius
            r = value * 1.8 + 32
            r = Double(round(1000*r)/1000)
            result = String(r) + " F"
            break
        case "fah": // Fahrenheit
            r = (value - 32) / (9/5)
            r = Double(round(1000*r)/1000)
            result = String(r) + " C"
            break
        case "cm": // Centimetres
            r = value / 2.54
            r = Double(round(1000*r)/1000)
            result = String(r) + " Inches"
            break
        case "in": // Inches
            r = value * 2.54
            r = Double(round(1000*r)/1000)
            result = String(r) + " Centimetres"
            break
        default: // Catch all for back input
            result = "Conversion not found"
        }
        
        return result
    }
    
    
    
    /*
     * Function     :   runConverter
     * Description  :   This will run once the user presses the Convert button.  It will grab the text from the
     *                  hidden label as well as attempt to get input from the text fields
     * Parameters   :   none
     * Return Value :   none
     */
    @IBAction func runConverter(_ sender: Any) {
        let operation: String? = lblOP.text  // Grabbing operation
        var val:Double = 0.0
        
        
        // Testing and grabbing input from textfields.
        // I believe from testing that if no input is in either field it will fill
        // a value for txtFieldB as 0
        if txtFieldA.text?.isEmpty == false {
            if let text = txtFieldA.text, let value = Double(text){
               val = value
            }
        }else if txtFieldB.text?.isEmpty == false{
            if let text = txtFieldB.text, let value = Double(text){
               val = value
            }
        }
       
        
        // Switch operation to run the correct convert method and store the result in the
        // result String
        var result: String = ""
        switch operation {
        case "temp":
            if txtFieldA.text?.isEmpty == false{
                result = convert(val, "cel")
            }else{
                result = convert(val, "fah")
            }
            break
        case "cm_in":
            if txtFieldA.text?.isEmpty == false{
                result = convert(val, "cm")
            }else{
                result = convert(val, "in")
            }
            break
        default:
            result = "Invalid Input"
        }
        // Once the first result has been received it unhides the
        // results view (stacked view) and fills the result label
        lblResult.text = result
        resultsView.isHidden = false    }
}
