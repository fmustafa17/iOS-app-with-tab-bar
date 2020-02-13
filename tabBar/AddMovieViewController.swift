//
//  AddMovieViewController.swift
//  tabBar
//
//  Created by Farhana Mustafa on 2/12/20.
//  Copyright © 2020 Farhana Mustafa. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    @IBOutlet weak var movieName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //var name: String = ""
    var name = Movie(title: "", description: "", director: "")
    //var name: Movie.title = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            //name = movieName.text!
            name.title = movieName.text!
            print(name.title)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
