//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 2/28/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Properties
    var model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asignamos la fuente de datos
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Nos damos de alta
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // nos damos de baja
        let notificationsCenter = NotificationCenter.default
        notificationsCenter.removeObserver(self);
    }
    
    @objc func houseDidChange(notification: Notification) {
        // Extraer el userInfo de la notificacion
        guard let info = notification.userInfo else {
            return
        }
        // Sacar la casa del userInfo
        let house = info[HOUSE_KEY] as? House
        
        // Actualizar el modelo
        model = house!.sortedMembers
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension MemberListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        // Devolver la celda
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = model[indexPath.row]
        let memberDetailViewController = MemberDetailViewController(model:member)
        navigationController?.pushViewController(memberDetailViewController, animated: true)
        
    }

}
