//
//  EmojiButtonView.swift
//
//  Created by Saurabh Rajput.
//

import UIKit

final class EmojiButtonView: UIView {
    
    //MARK: - Outlets
    @IBOutlet private weak var emojiButton: UIButton!
    
    ///`Callbacks`
    var didSelectReaction: ((String) -> Void)?
    
    
    //MARK: - Property Observer
    var emojiData: String! {
        didSet {
            emojiButton.setTitle(emojiData, for: .normal)
        }
    }
    
    //MARK: - Action Methods
    @IBAction private func didTapOnEmoji(_ sender: UIButton) {
        didSelectReaction?(sender.title(for: .normal) ?? "")
    }
}
