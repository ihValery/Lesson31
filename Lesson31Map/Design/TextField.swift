//
//  TextField.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import UIKit

class TextFieldDesign: UITextField {
    override func awakeFromNib() {
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        //смещение курсора
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: 0))
        leftViewMode = .always
    }
}
