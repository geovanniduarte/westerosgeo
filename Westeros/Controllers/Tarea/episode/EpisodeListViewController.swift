//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/2/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var episodeTableView: UITableView!
    
    
    // Mark: - models
    var model : [Episode]
    
    init(model: [Episode]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (Coder) ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Nos damos de alta
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: nil)
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
        let season = info[SEASON_KEY] as? Season
        
        // Actualizar el modelo
        model = season!.sortedEpisodes
        episodeTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension EpisodeListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let EPISODE_CELL_ID = "episode_cell"
        let episode = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: EPISODE_CELL_ID) ?? UITableViewCell(style: .default, reuseIdentifier: EPISODE_CELL_ID)
        
        // sync cell
        cell.textLabel?.text = episode.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(episodeDetailViewController, animated: true)
    }
}

