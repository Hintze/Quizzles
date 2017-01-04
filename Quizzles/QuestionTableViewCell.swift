//
//  QuestionTableViewCell.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-30.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var wrongAnswer1: UILabel!
    @IBOutlet weak var wrongAnswer2: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
