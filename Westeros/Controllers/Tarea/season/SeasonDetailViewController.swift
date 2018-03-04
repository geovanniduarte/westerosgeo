//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/1/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var episodesCount: UILabel!
    
    // Mark: Models
    var model : Season
    
    
    // Mark: - Initialization
    init(model: Season) {
        // Primero, limpias tu propio desorder
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.name
    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        syncViewModel()
        initUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - UI
    func initUI() {
        let episodesButon = UIBarButtonItem(title: "Episodes", style: .plain , target: self, action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItems = [episodesButon]
    }

    func syncViewModel() {
        name.text = "\(model.name) "
        launchDate.text = model.launchDay.formattedDate()
        episodesCount.text = model.count.description
    }
    
    @objc func displayEpisodes() {
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}

extension SeasonDetailViewController : SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, disSelectSeason season: Season) {
        self.model = season
        syncViewModel()
    }
}
