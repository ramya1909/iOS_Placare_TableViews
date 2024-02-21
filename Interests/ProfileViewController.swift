
import UIKit

class ProfileViewController: UIViewController
{
    @IBOutlet weak var ImgUser: UIImageView!
    @IBOutlet weak var LblName: UILabel!
    @IBOutlet weak var LblPhone: UILabel!
    @IBOutlet weak var ViewProfileBg: UIView!
    @IBOutlet weak var LblEmail: UILabel!
    @IBOutlet weak var LblAddress: UILabel!
    @IBOutlet weak var BtnBack: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewProfileBg.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        ViewProfileBg.layer.cornerRadius = ViewProfileBg.frame.height/2
       
        LblName.text = "Alex"
        LblPhone.text = "5678197367"
        LblEmail.text = "alex@gmail.com"
        LblAddress.text = "Cincinnati , Ohio"
        
        BtnBack.addTarget(self, action:#selector(onBtnClick), for: UIControl.Event.touchUpInside)
        BtnBack.setTitle("", for: UIControl.State.normal)
    }
    
    @objc func onBtnClick(_ sender: UIButton) -> Void {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}

