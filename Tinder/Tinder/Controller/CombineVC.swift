//
//  CombineVC.swift
//  Tinder
//
//  Created by Paulo Rodrigues on 29/11/21.
//

import UIKit

class CombineVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGroupedBackground
        
        self.addCards()
    }
    
}

extension CombineVC {
    
    @objc func handleCard(_ gesture: UIPanGestureRecognizer) {
        guard let card = gesture.view else { return }
        
        let point = gesture.translation(in: self.view)
        
        card.center = CGPoint(x: self.view.center.x + point.x, y: self.view.center.y + point.y)
        
        let rotationAngle = point.x / self.view.bounds.width * 0.4
        
        card.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.2) {
                card.center = self.view.center
                card.transform = .identity
            }
        }
    }
    
}

extension CombineVC {
    func addCards() {
        
        for itemCard in 1...3 {
            let redView = UIView()
            redView.backgroundColor = itemCard == 2 ? .blue : .red
            redView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width - 32, height: self.view.bounds.height * 0.7)
            
            redView.center = self.view.center
            
            let gesture = UIPanGestureRecognizer()
            gesture.addTarget(self, action: #selector(self.handleCard))
            
            redView.addGestureRecognizer(gesture)
            
            self.view.addSubview(redView)
        }
    }
}
