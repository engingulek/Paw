
import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble


protocol AdoptingHomeViewControllerInterfaca : AnyObject,Ables {
    func prepareCollectionView()
}

final class AdoptingHomeViewController: UIViewController{

    lazy var presenter : AdoptinHomePresenterInterface = AdoptinHomePresenter(view: self)
    private lazy var  adoptingHeaderView = AdoptingHeaderView()
    
    private lazy var collectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 5, height:UIScreen.main.bounds.height / 15 )
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(AdvertCollectionViewCell.self, forCellWithReuseIdentifier: AdvertCollectionViewCell.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter.viewDidload()
        navigationController?.navigationBar.isHidden  = true
        configureData()
    }
    
    // MARK: - ConfigureData
    private func configureData(){
        view.addSubview(adoptingHeaderView)
        adoptingHeaderView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.1)
        
        }
    }
}

// MARK: - CollectionViewDelegate
extension AdoptingHomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.categorNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertCollectionViewCell.identifier, for: indexPath) as? AdvertCollectionViewCell else {return UICollectionViewCell()}
        
        let category  = presenter.categoryCellForItemAt(index: indexPath.item)
        cell.configureData(category: category)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}

extension AdoptingHomeViewController : AdoptingHomeViewControllerInterfaca{
    func prepareCollectionView() {
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    
}






