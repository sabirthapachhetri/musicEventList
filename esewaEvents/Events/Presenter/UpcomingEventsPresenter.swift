//
//  UpcomingEventsPresenter.swift
//  esewaEvents
//
//  Created by Sabir's MacBook on 4/25/23.
//

import Foundation

protocol UpcomingEventsViewDelegate: AnyObject {
    func updateUpcomingEvents(with eventList: [UpcomingEventsDataModel]?)
}

class UpcomingEventsPresenter {
    var upcomingEvents: [UpcomingEventsDataModel] = [UpcomingEventsDataModel(day: "Today", date: "25 Apr, Tue"),
                                                     UpcomingEventsDataModel(day: "Tomorrow", date: "26 Apr, Wed"),
                                                     UpcomingEventsDataModel(day: "This Weekend", date: "28 Apr, Fri")]
    
    
    let delegate: UpcomingEventsViewDelegate?

    weak var view: SecondPageViewController?
    
    init(view: SecondPageViewController, delegate: UpcomingEventsViewDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func updateView() {
        self.delegate?.updateUpcomingEvents(with: upcomingEvents)
    }
}


//protocol AddItemToCartProtocol: AnyObject {
//    func displayItemList(model: [AddCartItemModel])
//
//}
//class AddCarItemPresenter {
//    var itemList: [AddCartItemModel] = [AddCartItemModel(itemName: "Iphone", itemDescription: "This is my iphone", itemCount: 1, itemPrice: 2000.0),AddCartItemModel(itemName: "Airpods", itemDescription: "This is my airpods", itemCount: 1, itemPrice: 1000.0)]
//
//
//    var delegate: AddItemToCartProtocol?
//
//   // weak var view: SecondPageViewController?
//
//    init(delegate: AddItemToCartProtocol) {
//        self.delegate = delegate
//    }
//
//    func populateTableView() {
//        self.delegate?.displayItemList(model: itemList)
//    }
//}
