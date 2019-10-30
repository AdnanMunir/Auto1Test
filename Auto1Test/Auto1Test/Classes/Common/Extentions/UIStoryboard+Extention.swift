//
//  UIStoryboard+Extention.swift
//  Auto1Test
//
//  Created by Adnan Munir on 14/08/2019.
//  Copyright © 2019 Adnan Munir. All rights reserved.
//

import Foundation

import UIKit

enum Storyboard:String {
    case Manufacturer
    case Model
    
}

protocol Storyboardable: AnyObject { }

extension Storyboardable where Self: UIViewController {
    
    static func instantiate(withStoryBoard storyBoard:Storyboard) -> Self {
        let storyboard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: Self.string) as? Self else {
            fatalError("Could not instantiate storyboard with name: \(storyBoard.rawValue)")
        }
        return vc
    }
}

extension UIViewController: Storyboardable { }
