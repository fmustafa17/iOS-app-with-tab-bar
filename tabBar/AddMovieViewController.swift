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
    @IBOutlet weak var movieDirector: UITextField!
    @IBOutlet weak var movieDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var name = Movie(title: "",  director: "", description: "")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            name.title = movieName.text!
            name.director = movieDirector.text!
            name.description = movieDescription.text!
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
