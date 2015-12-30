//
//  ViewController.swift
//  Colors
//
//  Created by John Huang on 2015/12/19.
//  Copyright © 2015年 JohnHuang. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    // 註解的是有問題的顏色，只顯示白色
    var colors: [String] = [
//        "Clear",
//        "Transparent",
        "AliceBlue",
        "AntiqueWhite",
        "Aqua",
        "Aquamarine",
        "Azure",
        "Beige",
        "Bisque",
        "Black",
        "BlanchedAlmond",
        "Blue",
        "BlueViolet",
        "Brown",
        "BurlyWood",
        "CadetBlue",
        "Chartreuse",
        "Chocolate",
        "Coral",
        "CornflowerBlue",
        "Cornsilk",
        "Crimson",
        "Cyan",
        "DarkBlue",
        "DarkCyan",
        "DarkGoldenRod",
        "DarkGray",
        "DarkGrey",
        "DarkGreen",
        "DarkKhaki",
        "DarkMagenta",
        "DarkOliveGreen",
        "DarkOrange",
        "DarkOrchid",
        "DarkRed",
        "DarkSalmon",
        "DarkSeaGreen",
        "DarkSlateBlue",
        "DarkSlateGray",
        "DarkSlateGrey",
        "DarkTurquoise",
        "DarkViolet",
        "DeepPink",
        "DeepSkyBlue",
        "DimGray",
        "DimGrey",
        "DodgerBlue",
        "FireBrick",
        "FloralWhite",
        "ForestGreen",
        "Fuchsia",
        "Gainsboro",
        "GhostWhite",
        "Gold",
        "GoldenRod",
//        "Gray",
//        "Grey",
        "Green",
        "GreenYellow",
        "HoneyDew",
        "HotPink",
        "IndianRed",
        "Indigo",
        "Ivory",
        "Khaki",
        "Lavender",
        "LavenderBlush",
        "LawnGreen",
        "LemonChiffon",
        "LightBlue",
        "LightCoral",
        "LightCyan",
        "LightGoldenRodYellow",
        "LightGray",
        "LightGrey",
        "LightGreen",
        "LightPink",
        "LightSalmon",
        "LightSeaGreen",
        "LightSkyBlue",
        "LightSlateGray",
        "LightSlateGrey",
        "LightSteelBlue",
        "LightYellow",
//        "Lime",
        "LimeGreen",
        "Linen",
        "Magenta",
        "Maroon",
        "MediumAquaMarine",
        "MediumBlue",
        "MediumOrchid",
        "MediumPurple",
        "MediumSeaGreen",
        "MediumSlateBlue",
        "MediumSpringGreen",
        "MediumTurquoise",
        "MediumVioletRed",
        "MidnightBlue",
        "MintCream",
        "MistyRose",
        "Moccasin",
        "NavajoWhite",
        "Navy",
        "OldLace",
        "Olive",
        "OliveDrab",
        "Orange",
        "OrangeRed",
        "Orchid",
        "PaleGoldenRod",
        "PaleGreen",
        "PaleTurquoise",
        "PaleVioletRed",
        "PapayaWhip",
        "PeachPuff",
        "Peru",
//        "Pink",
        "Plum",
        "PowderBlue",
        "Purple",
//        "Red",
        "RosyBrown",
        "RoyalBlue",
        "SaddleBrown",
        "Salmon",
        "SandyBrown",
        "SeaGreen",
        "SeaShell",
        "Sienna",
        "Silver",
        "SkyBlue",
        "SlateBlue",
        "SlateGray",
        "SlateGrey",
        "Snow",
        "SpringGreen",
        "SteelBlue",
//        "Tan",
//        "Teal",
        "Thistle",
        "Tomato",
        "Turquoise",
        "Violet",
        "Wheat",
        "White",
        "WhiteSmoke",
        "Yellow",
        "YellowGreen"
    ]

    
    @IBOutlet weak var questionColorLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    
    @IBOutlet weak var correctCountLabel: UILabel!

    @IBOutlet weak var wrongCountLabel: UILabel!
    
    
    var questionColorArray: [String] = []
    
    lazy var buttonArray: [UIButton] = {
        var result:[UIButton] = []
        for i in 1...16 {
            if let btn = self.valueForKey("button\(i)") as? UIButton {
                result.append(btn)
            }
        }
        return result
    }()
    
    var correctAnsIndex: Int = 0
    
    // MARK: -  Function

    @IBAction func buttonPressed(sender: UIButton) {
        if sender.tag == correctAnsIndex {
            if let correctCount = Int(correctCountLabel.text!) {
                correctCountLabel.text = "\(correctCount + 1)"
                setUp()
                hidden()
                show()
            }
        } else {
            if let wrongCount = Int(wrongCountLabel.text!) {
                wrongCountLabel.text = "\(wrongCount + 1)"
            }
        }
    }
    
    // 打亂顏色
    func shuffle() {
        colors = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(colors) as! [String]
    }
    
    // 設定按鈕
    func setColor() {
        
        if questionColorArray.count > 0 {
            questionColorArray.removeAll(keepCapacity: true)
        }
        
        // 取出打亂顏色的前15個顏色當題目
        for i in 0...buttonArray.count - 1 {
            let color = UIColor.init(hex: colors[i])
            buttonArray[i].backgroundColor = color
            buttonArray[i].tag = i
            // 設定圓角
            buttonArray[i].clipsToBounds = true
            buttonArray[i].layer.cornerRadius = buttonArray[i].frame.size.width / 2
            // 設定邊框
            buttonArray[i].layer.borderWidth = 1
            buttonArray[i].layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.9).CGColor
            // 問題陣列
            questionColorArray.append(colors[i])
        }
        print(questionColorArray)        
    }
    
    
    func setCorrectAnswer() {
        correctAnsIndex = myRandom(15)
        print("correctAnsIndex:\(correctAnsIndex)")
        questionColorLabel.text = questionColorArray[correctAnsIndex]
    }
    
    func myRandom(max: Int) -> Int {
        return Int(arc4random() % UInt32(max))
    }    
    
    func setUp() {
        // 打亂所有顏色陣列
        shuffle()
        
        // 設定按鈕
        setColor()
        
        // 設定顏色答案
        setCorrectAnswer()
    }
    
    // MARK: - Animation Function
    func hidden() {
        for i in 0...buttonArray.count-1 {
            buttonArray[i].alpha = 0
        }
    }
    
    func show() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            for i in 0...self.buttonArray.count-1 {
                self.buttonArray[i].alpha = 1
            }
        }, completion: nil)
    }
    
    // MARK: - ViewController lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        hidden()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        show()
    }




}










