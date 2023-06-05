import UIKit

class HomeViewController : UIViewController, HomePresenterViewDelegate {
    
    var presenter : HomePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        self.presenter = HomePresenter(delegate : self )
    }
    
    private func setupViews() { }

}
