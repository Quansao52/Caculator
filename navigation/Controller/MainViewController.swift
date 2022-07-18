//
//  ViewController.swift
//  navigation
//
//  Created by tran the quan on 13/07/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var exTxt: UITextField!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var resultTxt: UITextField!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var delBtn: UIButton!
    @IBOutlet weak var divBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var seBtn: UIButton!
    @IBOutlet weak var eibtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var mulBtn: UIButton!
    @IBOutlet weak var subBtn: UIButton!
    @IBOutlet weak var equalBtn: UIButton!
    @IBOutlet weak var dotBtn: UIButton!
    var state : Bool = true
    let operatorSet : Set = ["*","/","+","-","."]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "ONE"
       // self.navigationItem
        let equation: String = "99.0/6.0"
        let expr = NSExpression(format: equation)
        if let result = expr.expressionValue(with: nil, context: nil) as? NSNumber {
            print(result.floatValue) // -0.25
        }
        else {
            print("failed")
            
        }
        print("88/9-90.5".calculate())

}
    @IBAction func oneTouch(_ sender: Any) {
        exTxt.text = (exTxt.text ?? "" ) + "1";
    }
    @IBAction func twoTouch(_ sender: Any) {
        exTxt.text = (exTxt.text ?? "" ) + "2";
    }
    @IBAction func threeT(_ sender: Any) {
        exTxt.text = (exTxt.text ?? "" ) + "3";
    }
    @IBAction func fourT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "4";
    }
    @IBAction func fiveT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "5";
    }
    @IBAction func sixT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "6";
    }
    @IBAction func seT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "7";
    }
    @IBAction func eiT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "8";
    }
    @IBAction func nineT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "9";
    }
    @IBAction func zeroT(_ sender: Any){
        exTxt.text = (exTxt.text ?? "" ) + "0";
    }
    @IBAction func acT(_ sender: Any){
        exTxt.text = "";
    }
    @IBAction func delT(_ sender: Any){
        var tmp = exTxt.text
        if (tmp != "") {
            tmp!.remove(at: tmp!.index(before: tmp!.endIndex))
        }
        exTxt.text = tmp
    }
    @IBAction func divT(_ sender: Any){
       
        var last : String = exTxt.text ?? "ll"
        if last != "" {
        let lastt = String(last[last.index(before: last.endIndex)])
        if operatorSet.contains(lastt) {
            last.removeLast()
            exTxt.text = last + "/"
        }
        else {
            exTxt.text = (exTxt.text ?? "" ) + "/";
        }
        }
    }
    @IBAction func mulT(_ sender: Any){
        var last : String = exTxt.text ?? "ll"
        if last != "" {
        let lastt = String(last[last.index(before: last.endIndex)])
        if operatorSet.contains(lastt) {
            last.removeLast()
            exTxt.text = last + "*"
        }
        else {
            exTxt.text = (exTxt.text ?? "" ) + "*";
        }}
    }
    @IBAction func subT(_ sender: Any){
     
        var last : String = exTxt.text ?? "l"
        if last != "" {
        let lastt = String(last[last.index(before: last.endIndex)])
        if operatorSet.contains(lastt) {
            last.removeLast()
            exTxt.text = last + "-"
        }
        else {
            exTxt.text = (exTxt.text ?? "" ) + "-";
        }}
        
    }
    @IBAction func plusT(_ sender: Any){
       
        var last : String = exTxt.text ?? "l"
        if last != "" {
        let lastt = String(last[last.index(before: last.endIndex)])
        if operatorSet.contains(lastt) {
            last.removeLast()
            exTxt.text = last + "+"
        }
        else {
        exTxt.text = (exTxt.text ?? "" ) + "+";
        }}
    }
    @IBAction func equalT(_ sender: Any){
    
        let chars = String(format:exTxt.text ?? "")
        if chars != "" {
        if !operatorSet.contains(String(chars.last!) ) {
        let result = chars.calculate()
            let doubleResult = round(result.doubleValue*10000)/10000
            //resultTxt.text = ( floor(doubleResult) == doubleResult ) ? "\(floor(doubleResult))" : "\(Int(6))"
            if doubleResult.isInt { resultTxt.text = "\(Int(doubleResult))" }
             else
            {
                 resultTxt.text = "\((doubleResult))"
             }
        }
        else {resultTxt.text = "ERROR"
        }
        }

    }
    @IBAction func dotT(_ sender: Any){
        var last : String = exTxt.text ?? "l"
        if last != "" {
        let lastt = String(last[last.index(before: last.endIndex)])
        if operatorSet.contains(lastt) {
            last.removeLast()
            exTxt.text = last + "."
        }
        else {
            exTxt.text = (exTxt.text ?? "" ) + ".";
        }
        }
    }
    
}

