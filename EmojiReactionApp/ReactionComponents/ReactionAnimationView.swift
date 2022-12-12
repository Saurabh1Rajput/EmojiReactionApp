//
//  ReactionAnimationView.swift
//
//  Created by Saurabh Rajput.
//

import UIKit

enum PathType {
    case one, two, three, four
}

final class ReactionAnimationView: UIView {
    
    func presentAnimationWith(_ title: String = "") {
        (0...3).forEach { (_) in
            generateAnimatedViews(.one, with: title)
        }
        (0...3).forEach { (_) in
            generateAnimatedViews(.two, with: title)
        }
        (0...3).forEach { (_) in
            generateAnimatedViews(.three, with: title)
        }
        (0...3).forEach { (_) in
            generateAnimatedViews(.four, with: title)
        }
    }
    
    private func generateAnimatedViews(_ type: PathType, with title : String) {
        var path = UIBezierPath()
        if type == .one { path = customPath1()} else if type == .two {path = customPath2()} else if type == .three {path = customPath3()} else {path = customPath4()}
        
        //let imageView = UIImageView(image: image)
        
        let btnView = UIButton(type: .custom)
        btnView.setTitle(title, for: .normal)
        
        let dimension = 30 + drand48() * 10
        btnView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
        btnView.isUserInteractionEnabled = false
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        
        animation.path = path.cgPath
        animation.duration = 1.5 + drand48() * 3
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
        
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 1.0
        fadeOut.toValue = 0.0
        fadeOut.duration = animation.duration
        fadeOut.isRemovedOnCompletion = false
        fadeOut.fillMode = CAMediaTimingFillMode.forwards
        
        btnView.layer.add(animation, forKey: nil)
        btnView.layer.add(fadeOut, forKey: nil)
        
        addSubview(btnView)
    }
}

//MARK: - Animation Path
extension ReactionAnimationView {
    private func customPath1() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 150, y: 300))
        
        let endPoint = CGPoint(x: 150, y: 0)
        
        let randomXShift =  drand48() * 200
        let cp1 = CGPoint(x:  100 - randomXShift, y: 50)
        let cp2 = CGPoint(x:  200 + randomXShift, y: 100)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    private func customPath2() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 150, y: 300))
        
        let endPoint = CGPoint(x: 200, y: 0)
        
        let randomXShift = drand48() * 50
        let cp1 = CGPoint(x: 100 - randomXShift, y: 100)
        let cp2 = CGPoint(x: 200 + randomXShift, y: 200)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    private func customPath3() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 150, y: 300))
        
        let endPoint = CGPoint(x: 150, y: 0)
        
        let randomXShift = drand48() * 200
        
        let cp1 = CGPoint(x: 100 + randomXShift, y: 50)
        let cp2 = CGPoint(x: 200 - randomXShift, y: 100)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
    
    private func customPath4() -> UIBezierPath {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 150, y: 300))
        
        let endPoint = CGPoint(x: 100, y: 0)
        
        let randomXShift = drand48() * 50
        let cp1 = CGPoint(x: 100 + randomXShift, y: 100)
        let cp2 = CGPoint(x: 200 - randomXShift, y: 200)
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
        return path
    }
}
