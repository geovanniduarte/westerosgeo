//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 12/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Mark: - Properties
    var model: House
    
    // Mark: - Initialization
    init(model: House) {
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
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        // Model -> View
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
    }
    
    // Mark: - UI
    func setupUI() {
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain , target: self, action: #selector(displayWiki))
        let members = UIBarButtonItem(title: "Member", style: .plain, target: self, action: #selector(displayMembers))
        navigationItem.rightBarButtonItems = [wikiButton, members]
    }
    
    // lo que meta aqui debe ser compatible con objective c @objc
    @objc func displayWiki() {
        // Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        
        // Hacemos push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers() {
        let memberListViewController = MemberListViewController(model: model.sortedMembers)
        
        navigationController?.pushViewController(memberListViewController, animated: true)
    }
    
    
}

extension HouseDetailViewController: HouseListViewControllerDelegate {
    func houseListViewController(_ vievController: HouseListViewController, didSelectHouse house: House) {
        self.model = house
        syncModelWithView()
    }
}

















