//
//  DetailsViewController.swift
//  parsetagram
//
//  Created by kimeric on 4/15/18.
//  Copyright © 2018 EricKim. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class DetailsViewController: UIViewController {

    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var pictureImageView: PFImageView!
    @IBOutlet weak var captionText: UILabel!
    @IBOutlet weak var datePostedText: UILabel!
    
    var user: String = ""
    var caption: String = ""
    var date: String! = ""
    var file: PFFile?

    var post: PFObject!{
        didSet{
            
            user = (PFUser.current()?.username)!
            caption = (post["caption"] as? String)!
            date = "\(post.createdAt!)"
            file = post["media"] as? PFFile
            //            pictureImageView.loadInBackground()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameText.text = user
        captionText.text = caption
        datePostedText.text = date
        pictureImageView.file = file
        pictureImageView.loadInBackground()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
