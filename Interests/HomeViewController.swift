import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - IBOutlets
    @IBOutlet weak var ImgUser: UIImageView!
    @IBOutlet weak var ImgUpload: UIImageView!
    @IBOutlet weak var ViewSearch: UIView!
    @IBOutlet weak var LblSearch: UILabel!
    @IBOutlet weak var ImgSearch: UIImageView!
    @IBOutlet weak var IndoorCollectionView: UICollectionView!
    @IBOutlet weak var OutdoorCollectionView: UICollectionView!
 
    @IBOutlet weak var BtnUser: UIButton!
    
    
    let reuseIdentifier = "IndoorCollectionCell"
   
    struct Item {
        var imageName: String
        var text: String
    }

    let data: [Item] = [
        Item(imageName: "ArecaPlant2", text: "Areca"),
        Item(imageName: "SnakePlant", text: "Snake"),
        Item(imageName: "MonsterPlant", text: "Monster"),
        Item(imageName: "SnakePlant", text: "Snake"),
        Item(imageName: "ArecaPlant2", text: "Areca"),
        Item(imageName: "ArecaPlant2", text: "Areca"),
        Item(imageName: "ArecaPlant2", text: "Areca"),
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = IndoorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        IndoorCollectionView.showsHorizontalScrollIndicator = false
        
        if let layout = OutdoorCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        OutdoorCollectionView.showsHorizontalScrollIndicator = false
    
        dropShadowClosure(ViewSearch, .black, CGSize(width: 1, height: 1), 0.3, 2.0, 25, .allCorners, .white)
        
        BtnUser.addTarget(self, action:#selector(onBtnClick), for: UIControl.Event.touchUpInside)
        BtnUser.setTitle("", for: UIControl.State.normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func onBtnClick(_ sender: UIButton) -> Void {
        if let navController = self.navigationController {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let profileViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            navController.pushViewController(profileViewController, animated: true)
        }
    }
  
    let dropShadowClosure: (UIView, UIColor, CGSize, Float, CGFloat, CGFloat, UIRectCorner, UIColor) -> Void = { view, shadowColor, offSet, opacity, shadowRadius, cornerRadius, corners, fillColor in
        let shadowLayer = CAShapeLayer()
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let cgPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: size).cgPath
        shadowLayer.path = cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = cgPath
        shadowLayer.shadowOffset = offSet
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = shadowRadius
        view.layer.insertSublayer(shadowLayer, at: 0)
    }


    let setGradientBackgroundClosure: (UIView) -> Void = { view in
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = view.frame.size
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.systemGreen.cgColor, UIColor.white.cgColor]
        // Use different colors
        view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }

  
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if((collectionView == self.IndoorCollectionView) || (collectionView == self.OutdoorCollectionView))
        {
            return self.data.count
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let item = data[indexPath.item]
        if(collectionView == self.IndoorCollectionView)
        {    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IndoorCollectionCell", for: indexPath as IndexPath) as! IndoorCollectionCell

            cell.ImgV.image = UIImage(named: item.imageName)
            cell.Lbl.text = item.text
            cell.ImgV.layer.cornerRadius = 10
            cell.ImgV.clipsToBounds = true
            cell.backgroundColor = UIColor.white
            return cell
        }
        else
        {
            let outdoorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OutdoorCollectionCell", for: indexPath as IndexPath) as! OutdoorCollectionCell
            outdoorCell.OutdoorImgV.image = UIImage(named: item.imageName)
            outdoorCell.OutdoorLbl.text = item.text
            outdoorCell.OutdoorImgV.layer.cornerRadius = 10
            outdoorCell.OutdoorImgV.clipsToBounds = true
            outdoorCell.backgroundColor = UIColor.white
            return outdoorCell
        }
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let informationViewController = storyBoard.instantiateViewController(withIdentifier: "InformationViewController") as! InformationViewController
        navigationController?.pushViewController(informationViewController, animated: true)
    }
    
    fileprivate var interests = Interest.createInterests()
    
    fileprivate struct Storyboard {
        static let cellIdentifier = "Interest Cell"
    }
}



//extension HomeViewController: UIScrollViewDelegate {
//  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//    let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//    let cellWidthWithSpace = layout.itemSize.width + layout.minimumLineSpacing
//    
//    var offset = targetContentOffset.pointee
//    
//    let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpace
//    let roundedIndex = round(index)
//    
//    offset = CGPoint(x: roundedIndex * cellWidthWithSpace - scrollView.contentInset.left, y: -scrollView.contentInset.top)
//  }
//}
