//
//  Button.swift
//  Lesson31Map
//
//  Created by Валерий Игнатьев on 24.04.21.
//

import UIKit

//Кастомный класс для кнопок (УЧИМСЯ НЕ ДУБЛИРОВАТЬ КОД) плюс разгружаем основной класс
class ButtonDesign: UIButton {
    override func awakeFromNib() {
//        layer.cornerRadius = 5
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
    }
}

class ButtonDesignPlus: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

class ButtonDesignMinus: UIButton {
    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
