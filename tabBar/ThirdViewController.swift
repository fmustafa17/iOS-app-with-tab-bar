//
//  ThirdViewController.swift
//  tabBar
//
//  Created by Farhana Mustafa on 2/11/20.
//  Copyright © 2020 Farhana Mustafa. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var addRowButton: UIButton!
    
    
    @IBAction func addRowButtonFunc(_ sender: Any) {
        //Insert a row
        
    }
    
    @IBOutlet weak var doneButton: UIButton!
    
    
    @IBAction func doneButtonFunc(_ sender: Any) {
        //Get out of editing mode and hide the Done button
        tableView.isEditing = false
        doneButton.isHidden = true
    }
    
    private var dateCellExpanded: Bool = false
    private var selectedRowIndex: Int = 0
    var networkLayer = NetworkLayer.shared
    var movies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkLayer.fetchMovies(successHandler: { [weak self] (movies) in
            //print(movies)
            self?.movies = movies
        }) { (error) in
            print(error)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Hide the Done button until Edit button is clicked
        doneButton.isHidden = true;
    }

    @IBAction func editRowButton(_ sender: Any) {
        //Able to rearrange cells
        //Able to display delete button on the left
        tableView.isEditing = true
        doneButton.isHidden = false
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none
        }

        func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            return false
        }
    }
    
    
    //Add Movie functions. With collaboration from AddMovieViewController.swift
    var newMovie = Movie(title: "", director: "", description: "")

    @IBAction func cancel(segue:UIStoryboardSegue) {
        print("cancel was pressed")
    }

    @IBAction func done(segue:UIStoryboardSegue) {
        print("done was pressed")
        let addMovieVC = segue.source as! AddMovieViewController
        newMovie = Movie(title: addMovieVC.name.title, director: addMovieVC.name.director, description: addMovieVC.name.description)

        movies.append(newMovie)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfSections section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "MovieTableCell", for: indexPath) as? MovieTableCell)!
        cell.updateData(model: movies[indexPath.row])
        return cell
    }

    //delete button
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                tableView.beginUpdates()
                movies.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .top)
                tableView.endUpdates()
            }
    }
    
    //Rearrange cells when edit button is pressed
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = movies[sourceIndexPath.row]
        movies.remove(at: sourceIndexPath.row)
        movies.insert(movedObject, at: destinationIndexPath.row)
        debugPrint("\(sourceIndexPath.row) => \(destinationIndexPath.row)")
    }


    //Expand the cell size when clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if ((tableView.cellForRow(at: indexPath) as? MovieTableCell) != nil) {
            if dateCellExpanded {
                dateCellExpanded = false
            } else {
                dateCellExpanded = true
            }

            selectedRowIndex = indexPath.row

            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }


    //If a cell was selected, expand it to the following size.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedRowIndex {
            if dateCellExpanded {
                return 280
            }
            else {
                return 50
            }
        }
        return 50
    }
}
