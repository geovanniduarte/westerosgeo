//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/1/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblEmissionDate: UILabel!
    
    @IBOutlet weak var lblSeason: UILabel!
    // Mark: model
    let model : Episode
    
    // Mark: - Initialization
    init(model: Episode) {
        // Primero, limpias tu propio desorder
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.title
    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        syncViewModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func syncViewModel() {
        lblTitle.text = model.title
        lblEmissionDate.text = model.emissionDate.formattedDate()
        lblSeason.text = model.season?.description
    }

}
