
import UIKit
import CommonKit


typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol FavListViewControllerInterface : AnyObject,Ables {
    var presenter : FavListPresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
    func favListMessage(isHidden:Bool,message:String)
}


final class FavListViewController: UIViewController {
  lazy var presenter: FavListPresenterInterface = FavListPresenter(view: self)
    
    private lazy var favAdvertcollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.5, height:UIScreen.main.bounds.height / 4 )
        layout.scrollDirection = .vertical
        let  collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(FavAdvertCollectionViewCell.self, forCellWithReuseIdentifier: FavAdvertCollectionViewCell.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        return collectionview
    }()
    
    private lazy var messageLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload(userId: 1)
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewDidload(userId: 1)
        presenter.viewWillAppear()
    }
    
    private func configureUI(){
        view.addSubview(favAdvertcollectionview)
        favAdvertcollectionview.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}


extension FavListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(presenter.numberOfItems())
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = favAdvertcollectionview.dequeueReusableCell(
            withReuseIdentifier: FavAdvertCollectionViewCell.identifier,
            for: indexPath) as? FavAdvertCollectionViewCell else {return UICollectionViewCell()}
        let favAdvert = presenter.cellForItem(at: indexPath)
        cell.configureData(favAdvert: favAdvert)
        cell.delegate = self
        cell.indexPathItem = indexPath.item
        return cell
    }
}


extension FavListViewController: FavAdvertCollectionViewCellDelegate {
    func selectedFavIcon(index: Int) {
        presenter.deleteFavAdvertAction(index: index)
    }
}

extension FavListViewController : FavListViewControllerInterface {
   
    func prepareCollectionView() {
        favAdvertcollectionview.delegate = self
        favAdvertcollectionview.dataSource = self
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            favAdvertcollectionview.reloadData()
        }
    }
    
    func favListMessage(isHidden: Bool, message: String) {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.favAdvertcollectionview.isHidden = !isHidden
            self.messageLabel.isHidden = isHidden
            self.messageLabel.text = message
        }
    }
}


