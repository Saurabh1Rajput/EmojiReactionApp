//
//  ViewController.swift
//  EmojiReactionApp
//
//  Created by Saurabh Rajput on 12/12/22.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var reactionView: ReactionAnimationView!
    @IBOutlet private var reactionStack: UIStackView!
    
    private var reactionArray = ["😂", "🥳", "😮", "😭", "👍" , "❤️" , "🔥"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setReactionView()
    }
    
    
    private func setReactionView() {
        reactionStack.removeArrangedSubviews()
        for emoji in reactionArray {
            let btnView = EmojiButtonView().getXIB(type: EmojiButtonView.self)
            btnView.emojiData = emoji
            btnView.didSelectReaction = { [weak self] emoji in
                self?.reactionView.presentAnimationWith(emoji)
            }
            reactionStack.addArrangedSubview(btnView)
        }
    }
}

extension UIView {
    func getXIB<T:UIView>(type:T.Type) -> T {
        guard let XIB = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: [:])?.first as? T else {
            fatalError(String(describing: T.self) + "\(NSLocalizedString("couldn't be found in Storyboard file", comment: ""))")
        }
        return XIB
    }
}

extension UIStackView {
    func removeArrangedSubviews() {
        for view in arrangedSubviews {
            view.removeFromSuperview()
        }
    }
}
