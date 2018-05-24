//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by Fernando on 28.04.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        let grayView = UIView()
        grayView.backgroundColor = .gray
        
        let blackView = UIView()
        blackView.backgroundColor = .black
        
        [
            redView,
            blueView,
            yellowView,
            greenView,
            grayView,
            blackView
            ].forEach{ view.addSubview($0)}
        
        var widthView = 105
        
        
        //28 is the total horizontal padding, left: 14 and right: 14
        widthView = Int(view.frame.width / 3) - 28
        
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, trailing: view.trailingAnchor, bottom: nil, padding: .init(top: 14, left: 0, bottom: 0, right: 14), size: .init(width: widthView, height: 0))
        
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor, leading: nil, trailing: redView.trailingAnchor, bottom: nil, padding: .init(top: 14, left: 0, bottom: 0, right: 0))
        
        blueView.anchorSize(to: redView)
        
        yellowView.anchor(top: blueView.bottomAnchor, leading: nil, trailing: blueView.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, padding: .init(top: 14, left: 0, bottom: 10, right: 0))
        
        yellowView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        greenView.anchor(top: redView.topAnchor, leading: view.leadingAnchor, trailing: redView.leadingAnchor, bottom: blueView.bottomAnchor, padding: .init(top: 0, left: 14, bottom: 0, right: 16))
        
        grayView.anchor(top: greenView.bottomAnchor, leading: greenView.leadingAnchor, trailing: nil, bottom: nil, padding: .init(top: 14, left: 0, bottom: 0, right: 0))
        
        grayView.anchorSize(to: redView)
        
        blackView.anchor(top: greenView.bottomAnchor, leading: grayView.trailingAnchor, trailing: nil, bottom: nil, padding: .init(top: 14, left: 14, bottom: 0, right: 0))
        
        blackView.anchorSize(to: redView)
        
    }

}

extension UIView {
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
}

