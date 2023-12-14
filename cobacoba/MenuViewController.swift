//
//  MenuView.swift
//  cobacoba
//
//  Created by AIGS on 14/12/23.
//

import UIKit

class MenuViewController: UIViewController {
    var sampleText = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleText.text = "test"
        self.view.addSubview(sampleText)
        sampleText.translatesAutoresizingMaskIntoConstraints = false
        sampleText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        sampleText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
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
