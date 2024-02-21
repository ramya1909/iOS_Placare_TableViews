
import UIKit

class InformationViewController: UIViewController
{
    @IBOutlet weak var BtnBack: UIButton!
    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var Lbl1: UILabel!
    @IBOutlet weak var ImgV: UIImageView!
    @IBOutlet weak var Lbl2: UILabel!
    @IBOutlet weak var Lbl3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnBack.addTarget(self, action:#selector(onBtnClick), for: UIControl.Event.touchUpInside)
        BtnBack.setTitle("", for: UIControl.State.normal)
        LblTitle.text = "ARECA"
        Lbl1.text = "Root rot is a disease that attacks the roots of trees growing in wet or damp soil."
        Lbl2.text = "Root rot is a disease that attacks the roots of trees growing in wet or damp soil. This decaying disease can cut the life short of just about any type of tree or plant and has symptoms similar to other diseases and pest problems."
        Lbl3.text = "Root rot is a disease that attacks the roots of trees growing in wet or damp soil. This decaying disease can cut the life short of just about any type of tree or plant and has symptoms similar to other diseases and pest problems, like poor growth, wilted leaves, early leaf drop, branch dieback, and eventual death. Root rot is a disease that attacks the roots of trees growing in wet or damp soil. This decaying disease can cut the life short of just about any type of tree or plant and has symptoms similar to other diseases and pest problems, like poor growth, wilted leaves, early leaf drop, branch dieback, and eventual death."
        
        ImgV.image = UIImage(named: "ArecaPlant")
        ImgV.contentMode = .scaleAspectFill
        ImgV.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func onBtnClick(_ sender: UIButton) -> Void {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
