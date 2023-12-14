//
//  KeyboardViewController.swift
//  cobacoba
//
//  Created by AIGS on 12/12/23.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var buttonShift = KeyboardButton()
    var buttonDelete = KeyboardButton()
    var buttonNum = KeyboardButton()
    var buttonCustom = KeyboardButton()
    var buttonSpace = KeyboardButton()
    var buttonReturn = KeyboardButton()
    var buttonSymbol = KeyboardButton()
    
    var topRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var midRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var bottomRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var tNumRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var mNumRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var bNumRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var tSymRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    var mSymRow = UIView(frame: CGRectMake(0, 0, UIScreen.main.bounds.width, 45))
    
    var isNumKeysHidden = true
    var isSymbolKeysHidden = true
    var isCaps = false
    var isRegularKeysHidden = false
    var isCustomPageHidden = true
    
    let screenWidth = UIScreen.main.bounds.width
    
    lazy var menuVC: MenuViewController = {
        var viewController = MenuViewController()
        return viewController
    }()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Perform custom UI setup here
        self.setupLayout()
        print(self.view.frame.size.width)
    }
    func setupLayout() {
        let keyHeight = 45.0
        let keySpacing = 8.0
        
        let firstRow = ["q","w","e","r","t","y","u","i","o","p"]
        let secondRow = ["a","s","d","f","g","h","j","k","l"]
        let thirdRow = ["z","x","c","v","b","n","m"]
        let firstNumRow = ["1","2","3","4","5","6","7","8","9","0"]
        let secondNumRow = ["-","/",":",";","(",")","$","&","@","\""]
        let thirdNumRow = ["\u{002E}","\u{002E}","\u{003F}","\u{0021}","\u{0027}"]
        let firstSymRow = ["[","]","{","}","#","%","^","*","+","="]
        let secondSymRow = ["_","\\","|","~","<",">","€","£","¥","•"]
        
        let frButtons = createButtons(firstRow)
        let srButtons = createButtons(secondRow)
        let trButtons = createButtons(thirdRow)
        let frNumBtn = createButtons(firstNumRow)
        let srNumBtn = createButtons(secondNumRow)
        let trNumBtn = createButtons(thirdNumRow)
        let frSymBtn = createButtons(firstSymRow)
        let srSymBtn = createButtons(secondSymRow)
        
        for i in 0...9 {
            topRow.addSubview(frButtons[i])
            tNumRow.addSubview(frNumBtn[i])
            mNumRow.addSubview(srNumBtn[i])
            tSymRow.addSubview(frSymBtn[i])
            mSymRow.addSubview(srSymBtn[i])
        }
        self.view.addSubview(topRow)
        self.view.addSubview(tNumRow)
        self.view.addSubview(mNumRow)
        self.view.addSubview(tSymRow)
        self.view.addSubview(mSymRow)
        setupConstraints(for: frButtons, in: topRow)
        setupConstraints(for: frNumBtn, in: tNumRow)
        setupConstraints(for: srNumBtn, in: mNumRow)
        setupConstraints(for: frSymBtn, in: tSymRow)
        setupConstraints(for: srSymBtn, in: mSymRow)
        for button in srButtons {
            midRow.addSubview(button)
        }
        setupConstraints(for: srButtons, in: midRow)
        self.view.addSubview(midRow)
        for button in trButtons {
            bottomRow.addSubview(button)
        }
        setupConstraints(for: trButtons, in: bottomRow)
        self.view.addSubview(bottomRow)
        for button in trNumBtn {
            bNumRow.addSubview(button)
        }
        setupConstraints(for: trNumBtn, in: bNumRow)
        self.view.addSubview(bNumRow)
        
        topRow.translatesAutoresizingMaskIntoConstraints = false
        midRow.translatesAutoresizingMaskIntoConstraints = false
        bottomRow.translatesAutoresizingMaskIntoConstraints = false
        tNumRow.translatesAutoresizingMaskIntoConstraints = false
        mNumRow.translatesAutoresizingMaskIntoConstraints = false
        bNumRow.translatesAutoresizingMaskIntoConstraints = false
        tSymRow.translatesAutoresizingMaskIntoConstraints = false
        mSymRow.translatesAutoresizingMaskIntoConstraints = false
        
        buttonNum.translatesAutoresizingMaskIntoConstraints = false
        buttonShift.translatesAutoresizingMaskIntoConstraints = false
        buttonSpace.translatesAutoresizingMaskIntoConstraints = false
        buttonCustom.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonReturn.translatesAutoresizingMaskIntoConstraints = false
        buttonSymbol.translatesAutoresizingMaskIntoConstraints = false
        
        buttonNum.setTitle("123", for: .normal)
        buttonShift.setImage(UIImage(systemName: "shift"), for: .normal)
        buttonSpace.setTitle("space", for: .normal)
        buttonCustom.setImage(UIImage(systemName: "zzz"), for: .normal)
        buttonDelete.setImage(UIImage(systemName: "delete.left"), for: .normal)
        buttonReturn.setTitle("return", for: .normal)
        buttonSymbol.setTitle("#+=", for: .normal)
        
        buttonNum.backgroundColor = UIColor(named: "keyBG")
        buttonShift.backgroundColor = UIColor(named: "keyBG")
        buttonSpace.backgroundColor = UIColor(named: "keyBGLight")
        buttonCustom.backgroundColor = UIColor(named: "keyBG")
        buttonDelete.backgroundColor = UIColor(named: "keyBG")
        buttonReturn.backgroundColor = UIColor(named: "keyBG")
        buttonSymbol.backgroundColor = UIColor(named: "keyBG")
        
        buttonNum.tintColor = UIColor(named: "keyAccent")
        buttonNum.setTitleColor(UIColor(named: "keyAccent"), for: .normal)
        buttonShift.tintColor = UIColor(named: "keyAccent")
        buttonSpace.tintColor = UIColor(named: "keyAccent")
        buttonSpace.setTitleColor(UIColor(named: "keyAccent"), for: .normal)
        buttonCustom.tintColor = UIColor(named: "keyAccent")
        buttonDelete.tintColor = UIColor(named: "keyAccent")
        buttonReturn.tintColor = UIColor(named: "keyAccent")
        buttonReturn.setTitleColor(UIColor(named: "keyAccent"), for: .normal)
        buttonSymbol.tintColor = UIColor(named: "keyAccent")
        buttonSymbol.setTitleColor(UIColor(named: "keyAccent"), for: .normal)
        
        buttonNum.addTarget(self, action: #selector(changeNumeral(sender:)), for: .touchUpInside)
        buttonShift.addTarget(self, action: #selector(handleCaps(sender:)), for: .touchUpInside)
        buttonSpace.addTarget(self, action: #selector(handleSpace(sender:)), for: .touchUpInside)
        buttonCustom.addTarget(self, action: #selector(handleCustom(sender:)), for: .touchUpInside)
        buttonDelete.addTarget(self, action: #selector(handleDelete(sender:)), for: .touchUpInside)
        buttonReturn.addTarget(self, action: #selector(handleReturn(sender:)), for: .touchUpInside)
        buttonSymbol.addTarget(self, action: #selector(handleSymbol(sender:)), for: .touchUpInside)
        
        self.view.addSubview(buttonNum)
        self.view.addSubview(buttonShift)
        self.view.addSubview(buttonSpace)
        self.view.addSubview(buttonDelete)
        self.view.addSubview(buttonReturn)
        self.view.addSubview(buttonCustom)
        self.view.addSubview(buttonSymbol)
        
        topRow.isHidden = isRegularKeysHidden
        midRow.isHidden = isRegularKeysHidden
        bottomRow.isHidden = isRegularKeysHidden
        tNumRow.isHidden = isNumKeysHidden
        mNumRow.isHidden = isNumKeysHidden
        bNumRow.isHidden = isNumKeysHidden
        tSymRow.isHidden = isSymbolKeysHidden
        mSymRow.isHidden = isSymbolKeysHidden
        buttonSymbol.isHidden = isSymbolKeysHidden
        
        NSLayoutConstraint.activate([
            topRow.topAnchor.constraint(equalTo: self.view.topAnchor, constant: keySpacing),
            midRow.topAnchor.constraint(equalTo: topRow.bottomAnchor, constant: keySpacing),
            bottomRow.topAnchor.constraint(equalTo: midRow.bottomAnchor, constant: keySpacing),
            topRow.widthAnchor.constraint(equalToConstant: screenWidth),
            midRow.widthAnchor.constraint(equalToConstant: screenWidth * 0.9),
            bottomRow.widthAnchor.constraint(equalToConstant: screenWidth * 0.7),
            midRow.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomRow.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tNumRow.topAnchor.constraint(equalTo: self.view.topAnchor, constant: keySpacing),
            tNumRow.widthAnchor.constraint(equalToConstant: screenWidth),
            mNumRow.topAnchor.constraint(equalTo: tNumRow.bottomAnchor, constant: keySpacing),
            mNumRow.widthAnchor.constraint(equalToConstant: screenWidth),
            bNumRow.topAnchor.constraint(equalTo: mNumRow.bottomAnchor, constant: keySpacing),
            bNumRow.widthAnchor.constraint(equalToConstant: screenWidth * 0.7),
            bNumRow.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tSymRow.topAnchor.constraint(equalTo: self.view.topAnchor, constant: keySpacing),
            tSymRow.widthAnchor.constraint(equalToConstant: screenWidth),
            mSymRow.topAnchor.constraint(equalTo: tSymRow.bottomAnchor, constant: keySpacing),
            mSymRow.widthAnchor.constraint(equalToConstant: screenWidth),
            buttonShift.topAnchor.constraint(equalTo: midRow.bottomAnchor, constant: keySpacing),
            buttonShift.bottomAnchor.constraint(equalTo: bottomRow.bottomAnchor),
            buttonShift.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            buttonShift.widthAnchor.constraint(equalToConstant: screenWidth * 0.13),
            buttonDelete.topAnchor.constraint(equalTo: midRow.bottomAnchor, constant: keySpacing),
            buttonDelete.bottomAnchor.constraint(equalTo: bottomRow.bottomAnchor),
            buttonDelete.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            buttonDelete.widthAnchor.constraint(equalToConstant: screenWidth * 0.13),
            buttonSpace.topAnchor.constraint(equalTo: bottomRow.bottomAnchor, constant: keySpacing),
            buttonSpace.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -1.0),
            buttonSpace.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonSpace.widthAnchor.constraint(equalToConstant: screenWidth * 0.5),
            buttonCustom.topAnchor.constraint(equalTo: bottomRow.bottomAnchor, constant: keySpacing),
            buttonCustom.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -1.0),
            buttonCustom.rightAnchor.constraint(equalTo: buttonSpace.leftAnchor, constant: -5.0),
            buttonCustom.leftAnchor.constraint(equalTo: buttonNum.rightAnchor, constant: 5.0),
            buttonNum.topAnchor.constraint(equalTo: bottomRow.bottomAnchor, constant: keySpacing),
            buttonNum.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -1.0),
            buttonNum.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            buttonNum.widthAnchor.constraint(equalToConstant: screenWidth * 0.11),
            buttonReturn.topAnchor.constraint(equalTo: bottomRow.bottomAnchor, constant: keySpacing),
            buttonReturn.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -1.0),
            buttonReturn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -5.0),
            buttonReturn.leftAnchor.constraint(equalTo: buttonSpace.rightAnchor, constant: 5.0),
            buttonSymbol.topAnchor.constraint(equalTo: midRow.bottomAnchor, constant: keySpacing),
            buttonSymbol.bottomAnchor.constraint(equalTo: bottomRow.bottomAnchor),
            buttonSymbol.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5.0),
            buttonSymbol.widthAnchor.constraint(equalToConstant: screenWidth * 0.13)
        ])
    }
    func createButtons(_ titles: [String]) -> [KeyboardButton] {
        var buttons = [KeyboardButton]()
        for title in titles {
            let button = KeyboardButton()
            button.setTitle(title, for: .normal)
            button.backgroundColor = UIColor(named: "keyBGLight")
            button.setTitleColor(UIColor(named: "keyAccent"), for: .normal)
            button.addTarget(self, action: #selector(keyPressed(sender:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            buttons.append(button)
        }
        return buttons
    }
    @objc func keyPressed(sender: UIButton) {
        let button = sender as UIButton
        let title = button.title(for: .normal)
        (textDocumentProxy as UIKeyInput).insertText(title!)
    }
    @objc func changeNumeral(sender:UIButton) {
        if isRegularKeysHidden {
            isRegularKeysHidden = false
            isNumKeysHidden = true
            isSymbolKeysHidden = true
            buttonShift.isHidden = false
            buttonSymbol.isHidden = true
            buttonNum.setTitle("123", for: .normal)
        } else {
            isRegularKeysHidden = true
            isNumKeysHidden = false
            isSymbolKeysHidden = true
            buttonShift.isHidden = true
            buttonSymbol.isHidden = false
            buttonNum.setTitle("ABC", for: .normal)
        }
        topRow.isHidden = isRegularKeysHidden
        midRow.isHidden = isRegularKeysHidden
        bottomRow.isHidden = isRegularKeysHidden
        tNumRow.isHidden = isNumKeysHidden
        mNumRow.isHidden = isNumKeysHidden
        bNumRow.isHidden = isNumKeysHidden
        tSymRow.isHidden = isSymbolKeysHidden
        mSymRow.isHidden = isSymbolKeysHidden
    }
    @objc func handleSymbol(sender: UIButton) {
        if isSymbolKeysHidden {
            isSymbolKeysHidden = false
            isNumKeysHidden = true
            buttonSymbol.setTitle("123", for: .normal)
        } else {
            isSymbolKeysHidden = true
            isNumKeysHidden = false
            buttonSymbol.setTitle("#+=", for: .normal)
        }
        tSymRow.isHidden = isSymbolKeysHidden
        mSymRow.isHidden = isSymbolKeysHidden
        tNumRow.isHidden = isNumKeysHidden
        mNumRow.isHidden = isNumKeysHidden
    }
    @objc func handleCaps(sender: UIButton) {
        isCaps = !isCaps
        
        capslockOn(topRow)
        capslockOn(midRow)
        capslockOn(bottomRow)
    }
    func capslockOn(_ containerView: UIView) {
        let subview = containerView.subviews
        for view in subview {
            if let button = view as? UIButton {
                let buttonTitle = button.titleLabel!.text
                if isCaps {
                    let character = buttonTitle!.uppercased()
                    button.setTitle(character, for: .normal)
                } else {
                    let character = buttonTitle!.lowercased()
                    button.setTitle(character, for: .normal)
                }
            }
        }
    }
    
    @objc func handleSpace(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    @objc func handleCustom(sender: UIButton) {
        isCustomPageHidden = !isCustomPageHidden
        if isCustomPageHidden {
            addChild(menuVC)
            view.addSubview(menuVC.view)
            menuVC.view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            menuVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            menuVC.didMove(toParent: self)
        } else {
            if self.view.subviews.contains(self.menuVC.view) {
                menuVC.willMove(toParent: nil)
                menuVC.view.removeFromSuperview()
                menuVC.removeFromParent()
            }
        }
        self.view.layoutIfNeeded()
    }
    @objc func handleDelete(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    @objc func handleReturn(sender: UIButton) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }
    func setupConstraints(for buttons: [UIButton], in containingView: UIView) {
        for (index, button) in buttons.enumerated() {
            let topConstraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: containingView, attribute: .top, multiplier: 1.0, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: containingView, attribute: .bottom, multiplier: 1.0, constant: 0)
            var leftConstraint: NSLayoutConstraint!
            
            if index == 0 {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: containingView, attribute: .left, multiplier: 1.0, constant: 5)
            } else {
                leftConstraint = NSLayoutConstraint(item: button, attribute: .left, relatedBy: .equal, toItem: buttons[index-1], attribute: .right, multiplier: 1.0, constant: 5)
                let widthConstraints = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1.0, constant: 0)
                containingView.addConstraint(widthConstraints)
            }
            
            var rightConstraint: NSLayoutConstraint!
            if index == buttons.count - 1 {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: containingView, attribute: .right, multiplier: 1.0, constant: -5)
            } else {
                rightConstraint = NSLayoutConstraint(item: button, attribute: .right, relatedBy: .equal, toItem: buttons[index+1], attribute: .left, multiplier: 1.0, constant: -5)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, leftConstraint, rightConstraint])
        }
    }
    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
        
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let desiredHeight: CGFloat
        let autocompleteSpaceHeight = 32.0
        if UIDevice.current.userInterfaceIdiom == .phone {
            desiredHeight = 259 - autocompleteSpaceHeight
        } else {
            if UIDevice.current.orientation == .portrait{
                desiredHeight = 260 - autocompleteSpaceHeight
            } else {
                desiredHeight = 300 - autocompleteSpaceHeight
            }
        }
        let heightConstraint = NSLayoutConstraint(item: view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: desiredHeight)
        view.addConstraint(heightConstraint)
    }
}
