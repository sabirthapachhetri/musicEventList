////
////  FirstScreen.swift
////  esewaEvents
////
////  Created by Sabir's MacBook on 4/11/23.
////
//
//import UIKit
//
//class FirstScreen: UITableViewController {
//
//    let bgVC = BG()
//    let totalBalanceVC = TotalBalance()
//    let eventVC = EventView()
//    let contactVC = ContactView()
//    let submitVC = SubmitView()
//    let ticketSummaryVC = TicketSummaryView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Add the BG as a child view controller
//        addChild(bgVC)
//        view.addSubview(bgVC.view)
//        bgVC.didMove(toParent: self)
//
//        // Set the navigation item of the parent view controller to the navigation item of the child view controller
//        navigationItem.title = bgVC.navigationItem.title
//        navigationItem.leftBarButtonItem = bgVC.navigationItem.leftBarButtonItem
//
//        // Set the color of the back button and title to white
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//        // Add the TotalBalance as a child view controller
//        addChild(totalBalanceVC)
//        view.addSubview(totalBalanceVC.view)
//        totalBalanceVC.view.frame = CGRect(x: 0, y: 0, width: 370, height: 70)
//        totalBalanceVC.didMove(toParent: self)
//
//        // Add constraints to pin totalBalanceVC near the top safe area
//        totalBalanceVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            totalBalanceVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            totalBalanceVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            totalBalanceVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -330) // adjust the top spacing as needed
//                ])
//
//        // Add the EventView as a child view controller
//        addChild(eventVC)
//        view.addSubview(eventVC.view)
//        eventVC.view.frame = CGRect(x: 0, y: 0, width: 370, height: 130)
//        eventVC.didMove(toParent: self)
//
//        eventVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            eventVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            eventVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            eventVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 85) // adjust the top spacing as needed
//                ])
//
//        // Add the ticket summar as a child view controller
//        addChild(ticketSummaryVC)
//        view.addSubview(ticketSummaryVC.view)
//        ticketSummaryVC.didMove(toParent: self)
//
//        // Add constraints to pin totalBalanceVC near the top safe area
//        ticketSummaryVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            ticketSummaryVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            ticketSummaryVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            ticketSummaryVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 394)
//                ])
//
//
//        // Add the contact as a child view controller
//        addChild(contactVC)
//        view.addSubview(contactVC.view)
//        contactVC.view.frame = CGRect(x: 0, y: 0, width: 370, height: 70)
//        contactVC.didMove(toParent: self)
//
//        contactVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            contactVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            contactVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            contactVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500)
//                ])
//
//        addChild(submitVC)
//        view.addSubview(submitVC.view)
//        submitVC.view.frame = CGRect(x: 0, y: 0, width: 370, height: 70)
//        submitVC.didMove(toParent: self)
//
//        // Add constraints to pin totalBalanceVC near the top safe area
//        submitVC.view.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            submitVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            submitVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            submitVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 630)
//                ])
//
//        }
//}

//
//class FirstScreen: UITableViewController {
//
//    let bgVC = BG()
//
//    let childVCs = [TotalBalance(), EventView(), TicketSummaryView(), ContactView(), SubmitView()]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return childVCs.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let childVC = childVCs[indexPath.row]
//        childVC.view.frame = cell.contentView.bounds
//        cell.contentView.addSubview(childVC.view)
//        childVC.didMove(toParent: self)
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let childVC = childVCs[indexPath.row]
//        return childVC.view.frame.height
//    }
//
//}

import UIKit
class FirstScreen: UITableViewController {

    let container = UIView()
    
    let bgVC = BG()
    let totalBalanceVC = TotalBalance()
    let eventVC = EventView()
    let contactVC = ContactView()
    let submitVC = SubmitView()
    let ticketSummaryVC = TicketSummaryView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // add the container view as a subview of the table view
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        addChild(bgVC)
        container.addSubview(bgVC.view)
        bgVC.didMove(toParent: self)

        
        // Set the navigation item of the parent view controller to the navigation item of the child view controller
        navigationItem.title = bgVC.navigationItem.title
        navigationItem.leftBarButtonItem = bgVC.navigationItem.leftBarButtonItem
        
        // Set the color of the back button and title to white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
//        navigationController?.navigationBar.backgroundColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)
//        navigationController?.navigationBar.barTintColor = UIColor(red: 48/255, green: 219/255, blue: 65/255, alpha: 1.0)

        // Add the child view controllers to the container view
        addChild(totalBalanceVC)
        container.addSubview(totalBalanceVC.view)
        totalBalanceVC.view.frame = CGRect(x: 0, y: 0, width: 370, height: 70)
        totalBalanceVC.didMove(toParent: self)
        
        // Add constraints to pin totalBalanceVC near the top safe area
        totalBalanceVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            totalBalanceVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            totalBalanceVC.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            totalBalanceVC.view.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: -330) // adjust the top spacing as needed
        ])

        addChild(eventVC)
        container.addSubview(eventVC.view)
        eventVC.view.frame = CGRect(x: 0, y: 85, width: 370, height: 130)
        eventVC.didMove(toParent: self)
        
        eventVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            eventVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            eventVC.view.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            eventVC.view.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 85) // adjust the top spacing as needed
        ])
        
        addChild(ticketSummaryVC)
        container.addSubview(ticketSummaryVC.view)
        ticketSummaryVC.view.frame = CGRect(x: 0, y: 394, width: 370, height: 70)
        ticketSummaryVC.didMove(toParent: self)

        ticketSummaryVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ticketSummaryVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            ticketSummaryVC.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 390),
            ticketSummaryVC.view.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 394)
        ])

        addChild(contactVC)
        container.addSubview(contactVC.view)
        contactVC.view.frame = CGRect(x: 0, y: 500, width: 370, height: 70)
        contactVC.didMove(toParent: self)
        
        contactVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            contactVC.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 390),
            contactVC.view.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 500)
        ])

        addChild(submitVC)
        container.addSubview(submitVC.view)
        submitVC.view.frame = CGRect(x: 0, y: 630, width: 370, height: 70)
        submitVC.didMove(toParent: self)
        
        submitVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            submitVC.view.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            submitVC.view.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: 390),
            submitVC.view.topAnchor.constraint(equalTo: container.safeAreaLayoutGuide.topAnchor, constant: 630)
        ])
    }
}
