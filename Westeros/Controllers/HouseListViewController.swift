//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 2/15/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"

protocol HouseListViewControllerDelegate {
    func houseListViewController(_ vievController: HouseListViewController, didSelectHouse house: House)
}
class HouseListViewController: UITableViewController {
    
    // Mark: - Properties
    let model: [House]
    var delegate: HouseListViewControllerDelegate?
    
    init(model: [House]) {
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (Coder) ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "HouseCell"
        
        // Descubir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda si hay en cache, si no devuelve nil
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        // por el nil es necesario validad
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar house (model) con cell (vista)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name

        return cell!
    }
    
    // Mark: Tablw View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let house = model[indexPath.row]
        
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        // Mando la misma info a traves de notificaciones
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY : house])
        
        notificationCenter.post(notification)
    }
    
}
