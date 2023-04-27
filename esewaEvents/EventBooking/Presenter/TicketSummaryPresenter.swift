import Foundation

protocol TicketSummaryViewDelegate: AnyObject {
    func updateTicketSummary(silverTickets: Int, goldTickets: Int, diamondTickets: Int, cashback: Double, subtotal: Double, grandTotal: Double)
}

class TicketSummaryPresenter {
    
    var tickets: [Ticket] = [Ticket(name: "Silver", price: 888),
                             Ticket(name: "Silver", price: 888),
                             Ticket(name: "Silver", price: 888),
                             Ticket(name: "Gold", price: 3999),
                             Ticket(name: "Gold", price: 3999),
                             Ticket(name: "Diamond", price: 6999)]
    
    let delegate: TicketSummaryViewDelegate?

    weak var view: TicketSummaryView?
    
    init(view: TicketSummaryView, delegate: TicketSummaryViewDelegate) {
        self.view = view
        self.delegate = delegate
    }
    
    func updateView() {
        let cashBack = calculateCashBack()
        let subtotal = calculateSubtotal()
        let grandTotal = calculateGrandTotal(with: cashBack)
        
        delegate?.updateTicketSummary(silverTickets: silverTicketCount(), goldTickets: goldTicketCount(), diamondTickets: diamondTicketCount(), cashback: cashBack, subtotal: subtotal, grandTotal: grandTotal)
    }
    
    func silverTicketCount() -> Int {
        return tickets.filter({ $0.name == "Silver" }).count
    }

    func goldTicketCount() -> Int {
        return tickets.filter({ $0.name == "Gold" }).count
    }

    func diamondTicketCount() -> Int {
        return tickets.filter({ $0.name == "Diamond" }).count
    }

    func calculateCashBack() -> Double {
        return 100
    }

    func calculateSubtotal() -> Double {
        var subtotal = 0.0
            for ticket in tickets {
                subtotal += ticket.price
            }
            return subtotal
    }

    func calculateGrandTotal(with cashBack: Double = 100) -> Double {
        return calculateSubtotal() - cashBack
    }
}

