////
////  AddCartItelListVC.swift
////  esewaEvents
////
////  Created by Sabir's MacBook on 5/4/23.
////
//
//import Foundation
//import UIKit
//class AddCartIteListVC: UIViewController, AddItemToCartProtocol {
//    
//    
//    var presenter: AddCarItemPresenter?
//    var tableView = UITableView()
//    var model = [AddCartItemModel]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        self.presenter = AddCarItemPresenter(delegate: self)
//        presenter?.populateTableView()
//    }
//    
//    func displayItemList(model: [AddCartItemModel]) {
//        self.model = model
//        tableView.reloadData()
//    }
//}
//
//extension AddCartIteListVC: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return model.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = model[indexPath.row]
//        
//    }
//    
//    
//
//}
