//
//  ToDoCell.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 6.08.2023.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var toDoItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
