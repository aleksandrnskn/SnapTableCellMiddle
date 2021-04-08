//
//  ViewController.swift
//  SnapTableCellMiddle
//
//  Created by Aleksandr Aniskin on 08.04.2021.
//

import UIKit

struct Airplane {
    let image: UIImage
    let name: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var airplaneTableView: UITableView!
    
    var airplanes = [
        Airplane(image: UIImage(named: "Airbus-A319")!, name: "Airbus A319"),
        Airplane(image: UIImage(named: "Airbus_A320")!, name: "Airbus A320"),
        Airplane(image: UIImage(named: "Airbus-A321")!, name: "Airbus A321"),
        Airplane(image: UIImage(named: "Airbus-A321-neo")!, name: "Airbus A321-neo"),
        Airplane(image: UIImage(named: "Airbus-A330-300")!, name: "Airbus A330-300"),
        Airplane(image: UIImage(named: "Airbus-A340-300")!, name: "Airbus A340-300"),
        Airplane(image: UIImage(named: "Airbus-A340-600")!, name: "Airbus A340-600"),
        Airplane(image: UIImage(named: "Airbus-A350-900")!, name: "Airbus A350-900"),
        Airplane(image: UIImage(named: "Airbus-A350-1000")!, name: "Airbus A350-1000"),
        Airplane(image: UIImage(named: "Airbus-A380")!, name: "Airbus A380")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        airplaneTableView.delegate = self
        airplaneTableView.dataSource = self
        airplaneTableView.rowHeight = 250
    }

    func scrollViewDidDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate == false {
            self.centerTable()
        }
    }
    
    func centerTable() {
        let midX: CGFloat = self.airplaneTableView.bounds.midX
        let midY: CGFloat = self.airplaneTableView.bounds.midY
        let midPoint: CGPoint = CGPoint(x: midX, y: midY)
        
        if let pathForCenterCell: IndexPath = self.airplaneTableView.indexPathForRow(at: midPoint) {
            self.airplaneTableView.scrollToRow(at: pathForCenterCell, at: .middle, animated: true)
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airplanes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AirplaneViewCell
        cell.airplaneImageView.image = airplanes[indexPath.row].image
        cell.airplaneLabel.text = airplanes[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
