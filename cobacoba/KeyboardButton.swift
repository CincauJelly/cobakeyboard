//
//  KeyboardButton.swift
//  cobacoba
//
//  Created by AIGS on 13/12/23.
//

import UIKit

class KeyboardButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var defaultBackgroundColor: UIColor = UIColor(named: "keyBG") ?? .white
    var highlightBackgroundColor: UIColor = .lightGray

    override init(frame: CGRect) {
      super.init(frame: frame)
      customInit()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      customInit()
    }

    override func layoutSubviews() {
      super.layoutSubviews()
//      backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
//        tintColor = UIColor(named: "keyAccent")
    }

}

private extension KeyboardButton {
  func customInit() {
    layer.cornerRadius = 5.0
    layer.masksToBounds = false
    layer.shadowOffset = CGSize(width: 0, height: 1.0)
    layer.shadowRadius = 0.0
    layer.shadowOpacity = 0.35
  }
}
