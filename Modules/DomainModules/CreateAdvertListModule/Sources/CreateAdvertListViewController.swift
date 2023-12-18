
import Foundation
import UIKit
import CommonKit
import SnapKit


typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble

protocol CreateAdvertListViewControllerInterface : AnyObject,Ables {
    var presenter : CreateAdvertListPresenterInterface {get}
    func prepareCollectionView()
    func reloadCollectionView()
    func createMessage(isHidden:Bool,message:String)
}

final class CreateAdvertListViewController : UIViewController{
    lazy var presenter: CreateAdvertListPresenterInterface = CreateAdvertListPresenter(view: self)
    
    
    private lazy var createAdvertcollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.5, height:UIScreen.main.bounds.height / 4 )
        layout.scrollDirection = .vertical
        let  collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.register(CreateAdvertCollectionViewCell.self, forCellWithReuseIdentifier: CreateAdvertCollectionViewCell.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        return collectionview
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
    private func configureUI(){
        view.addSubview(createAdvertcollectionview)
        createAdvertcollectionview.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}
//CreateAdvertListViewControllerInterface
extension CreateAdvertListViewController : CreateAdvertListViewControllerInterface {
    func prepareCollectionView() {
        createAdvertcollectionview.delegate = self
        createAdvertcollectionview.dataSource = self
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            createAdvertcollectionview.reloadData()
        }
      
    }
    
    func createMessage(isHidden: Bool, message: String) {
        
    }
}

extension CreateAdvertListViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = createAdvertcollectionview.dequeueReusableCell(
           withReuseIdentifier: CreateAdvertCollectionViewCell.identifier,
           for: indexPath) as? CreateAdvertCollectionViewCell else {return UICollectionViewCell()}
       let createAdvert = presenter.cellForItem(at: indexPath)
       cell.configureData(createAdvert: createAdvert)
       cell.delegate = self
       cell.indexPathItem = indexPath.item
       return cell
    }
}

extension CreateAdvertListViewController : CreateAdvertCollectionViewCellDelegate {
    func selectedTrashIcon(index: Int) {
        presenter.selectedTrashIcon(index: index)
    }
    
    
}
