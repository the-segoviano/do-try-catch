//
//  Alert.swift
//  Do Try Catch
//
//  Created by Luis Segoviano on 14/01/20.
//  Copyright © 2020 The Segoviano. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
