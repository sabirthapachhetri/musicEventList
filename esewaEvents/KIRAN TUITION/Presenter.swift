//
//  Presenter.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 5/7/23.
//

import Foundation

protocol AddItemToCartProtocol: AnyObject {
    func displayItemList(model: [AddCartItemModel])
}

class AddCartItempresenter {
    
    var itemList: [AddCartItemModel] = [
        AddCartItemModel(itemName: "Iphone", itemDescription: "This is my iphone", itemCount: 1, itemPrice: 6000.0),
        AddCartItemModel(itemName: "Airpods", itemDescription: "This is my airpods", itemCount: 1, itemPrice: 1000.0),
        AddCartItemModel(itemName: "Apple Watch", itemDescription: "This is my watch", itemCount: 1, itemPrice: 3000.0),
        AddCartItemModel(itemName: "MacBook", itemDescription: "This is my laptop", itemCount: 1, itemPrice: 10000.0)]


    var delegate: AddItemToCartProtocol?

    init(delegate: AddItemToCartProtocol) {
        self.delegate = delegate
    }

    func populateTableView() {
        self.delegate?.displayItemList(model: itemList)
    }
}
