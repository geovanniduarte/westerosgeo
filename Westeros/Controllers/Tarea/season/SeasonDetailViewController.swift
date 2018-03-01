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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func syncViewModel() {
        name.text = "\(model.name) "
        launchDate.text = model.launchDay.description
        episodesCount.text = model.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
