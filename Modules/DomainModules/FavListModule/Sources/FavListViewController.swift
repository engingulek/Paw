
import UIKit
import CommonKit


typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol FavListViewControllerInterface : AnyObject,Ables {
    var presenter : FavListPresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidload()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    }
}


extension FavListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = favAdvertcollectionview.dequeueReusableCell(
            withReuseIdentifier: FavAdvertCollectionViewCell.identifier,
            for: indexPath) as? FavAdvertCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    
}

extension FavListViewController : FavListViewControllerInterface {
    func prepareCollectionView() {
        favAdvertcollectionview.delegate = self
        favAdvertcollectionview.dataSource = self
    }
    
    func reloadCollectionView() {
        favAdvertcollectionview.reloadData()
    }
    
    
}


