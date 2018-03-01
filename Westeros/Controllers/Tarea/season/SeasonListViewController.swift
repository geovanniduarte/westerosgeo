//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/1/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonListViewController: UITableViewController {
    
    var model : [Season]
    
    init(model: [Season]) {
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
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let SEASON_CELL_ID = "season_cell"
        
        let season = model[indexPath.]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: SEASON_CELL_ID, for: indexPath)

        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: SEASON_CELL_ID)
        }
        // sync
        cell.textLabel?.text = season.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = model[indexPath.row]
        let seasonDetailViewController = SeasonDetailViewController(model: season)
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
    }
    
}
