import UIKit

class BusTicketSelectViewController: UIViewController {

    var containerView = UIView()
    
    var bookedStatus = BusSeatStatusView(image: UIImage(named: "booked")!, name: "Booked")
    var availableStatus = BusSeatStatusView(image: UIImage(named: "available")!, name: "Available")
    var selectedStatus = BusSeatStatusView(image: UIImage(named: "selected")!, name: "Selected")
    
    var busSeatView = BusSeatView(frame: CGRect(x: 0, y: 0, width: 400, height: 450))
    
    var bookSeatView = BookSeatView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        busSeatView.selectedSeats = { seatText in
            self.bookSeatView.totalPayingAmountValueLabel.text = seatText
        }

        view.backgroundColor = viewBackgroundColor
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 20

        bookedStatus.translatesAutoresizingMaskIntoConstraints = false
        availableStatus.translatesAutoresizingMaskIntoConstraints = false
        selectedStatus.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(bookedStatus)
        containerView.addSubview(availableStatus)
        containerView.addSubview(selectedStatus)
        
        bookSeatView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerView)
        view.addSubview(busSeatView)
        view.addSubview(bookSeatView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 400),
            containerView.heightAnchor.constraint(equalToConstant: 100),
            
            bookedStatus.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            bookedStatus.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            availableStatus.leadingAnchor.constraint(equalTo: bookedStatus.trailingAnchor, constant: 130),
            availableStatus.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            selectedStatus.leadingAnchor.constraint(equalTo: availableStatus.trailingAnchor, constant: 130),
            selectedStatus.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            bookSeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bookSeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bookSeatView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bookSeatView.heightAnchor.constraint(equalToConstant: 80)
        ])

    }
}
