//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/1/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
    
    let model : [Episode]
    
    init(model: [Episode]) {
        self.model = model
        super.init(style: .plain)
        title = "Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (Coder) ")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let EPISODE_CELL_ID = "episode_cell"
        let episode = model[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: EPISODE_CELL_ID, for: indexPath)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: EPISODE_CELL_ID)
        }
        
        // sync cell
        cell.textLabel?.text = episode.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailViewController = EpisodeDetailViewController(model: episode)
        
    }

    
}
