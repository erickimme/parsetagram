//
//  FeedCell.swift
//  parsetagram
//
//  Created by kimeric on 4/13/18.
//  Copyright © 2018 EricKim. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FeedCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: PFImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    var post: PFObject!{
        didSet{
            usernameLabel.text = PFUser.current()?.username
            self.captionLabel.text = post["caption"] as? String
            print(post["media"])
            pictureImageView.file = post["media"] as! PFFile
            pictureImageView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
