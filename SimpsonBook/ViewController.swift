//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Selçuk İleri on 5.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let homer = Simpson(name: "Homer Simpson", job: "Nuclear Safety", image:UIImage(named: "homer")!)
        let marge = Simpson(name: "Marge Simpson", job: "Housewife", image:UIImage(named: "marge")!)
        let bart = Simpson(name: "Bart Simpson", job: "Student", image:UIImage(named: "bart")!)
        let lisa = Simpson(name: "Lisa Simpson", job: "Student", image:UIImage(named: "lisa")!)
        let montgomery = Simpson(name: "Montgomery Simpson", job: "Crazy", image:UIImage(named: "montgomery")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(montgomery)
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
            
    }

}

