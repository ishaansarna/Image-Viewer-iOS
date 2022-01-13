//
//  ViewController.swift
//  Image Viewer
//
//  Created by Ishaan Sarna on 03/01/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let imageViewController = storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController {
            imageViewController.selectedImage = pictures[indexPath.row]
            imageViewController.imageNumber = indexPath.row+1
            imageViewController.totalImages = pictures.count
            navigationController?.pushViewController(imageViewController, animated: true)
        }
    }


}

