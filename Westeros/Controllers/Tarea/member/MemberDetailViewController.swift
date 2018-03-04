//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 3/2/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    // Mark: - Outlets

    @IBOutlet weak var lblName: UILabel!
    
   
    @IBOutlet weak var lblAlias: UILabel!
    

    @IBOutlet weak var lblHouse: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: model
    let model : Person
    
    // Mark: - Initialization
    init(model: Person) {
        self.model = model
        // Llamas a super
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        title = model.fullName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        syncView()
    }
    
    func syncView() {
        lblName.text = model.name
        lblAlias.text = model.alias
        lblHouse.text = model.house.name
    }

}
