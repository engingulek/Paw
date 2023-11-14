
import UIKit
import CommonKit
import SnapKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble


protocol AdoptingHomeViewControllerInterfaca : AnyObject,Ables {
    var presenter : AdoptinHomePresenterInterface {get set}
    func prepareCollectionView()
    func prepareTableView()
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
        collectionview.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        return collectionview
    }()
    
    private lazy var advertTableView :  UITableView = {
        let tableView = UITableView()
        tableView.register(AdvertTableViewCell.self, forCellReuseIdentifier: AdvertTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter.viewDidload()
      
        //navigationController?.navigationBar.isHidden  = true
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
        
        
        view.addSubview(advertTableView)
        advertTableView.snp.makeConstraints { make in
            make.top.equalTo(collectionview.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
        
        let category  = presenter.categoryCellForItemAt(index: indexPath.item)
        cell.configureData(category: category)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        return cell
    }
}


extension AdoptingHomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdvertTableViewCell.identifier, for: indexPath) as? AdvertTableViewCell else {return UITableViewCell()}
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectItem(index: indexPath.row)
    }
    
    
}

extension AdoptingHomeViewController : AdoptingHomeViewControllerInterfaca{
   
    
    func prepareCollectionView() {
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    
    
    func prepareTableView() {
        advertTableView.delegate = self
        advertTableView.dataSource = self
    }
    
}






