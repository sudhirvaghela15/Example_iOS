//
//  Card2Cell.swift
//  SOLID_principles_Example_iOS
//
//  Created by sudhir on 24/01/25.
//


import UIKit

class Card2Cell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(item: CardModel?) {
        guard let item else { return }
        
        self.titleLabel.text = item.title
		statusLabel.text = item.description
    }
}
