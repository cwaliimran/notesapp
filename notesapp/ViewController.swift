//
//  ViewController.swift
//  notesapp
//
//  Created by Ali on 8/26/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
 

    @IBOutlet var table : UITableView?
    @IBOutlet var label : UILabel?
    
    var models: [(title:String, note:String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table?.delegate = self
        table?.dataSource = self
       title = "Notes App"
    }

    @IBAction func didTapNewNote(){
        
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //show not controller
          guard let vc = storyboard?.instantiateViewController(identifier : "note") as? NoteViewController else {
              return
          }
          vc.title = "Note"
          navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    

}

