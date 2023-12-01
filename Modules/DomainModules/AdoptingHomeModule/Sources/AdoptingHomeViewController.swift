
import UIKit
import CommonKit
import SnapKit
import AdvertFilterModuleInterface
import AdoptingHomeModuleInterface
import ModelKit
typealias Ables = UIViewControllerAble & NavConAble & TabbarConAble


protocol AdoptingHomeViewControllerInterfaca : AnyObject,Ables {
    var presenter : AdoptinHomePresenterInterface {get}
    func prepareCollectionView()
    func prepareTableView()
    func reloadCollectionView()
    func reloadTableView()
    func startTableViewLoding()
    func finishTableViewLoading()
    func advertListMessage(isHidden:Bool,message:String)
   // func badgeLabelInHeaderView(isHidden:Bool,count:Int)
}

 final class AdoptingHomeViewController: UIViewController{
     private var filterList : [AdoptingAdvert] = []
    lazy var presenter : AdoptinHomePresenterInterface = AdoptinHomePresenter(view: self)
    private lazy var  adoptingHeaderView = AdoptingHeaderView(
        frame:CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: self.view.layer.frame.height / 4 ) )
    
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
    
    private lazy var tableViewActivityIndicator : UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.color = .black
        return indicator
    }()
    
    private lazy var advertTableView :  UITableView = {
        let tableView = UITableView()
        tableView.register(AdvertTableViewCell.self, forCellReuseIdentifier: AdvertTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
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
        presenter.viewDidload()
        navigationController?.navigationBar.isHidden = true
        adoptingHeaderView.delegate = self
        configureData()
    }
     
     override func viewWillAppear(_ animated: Bool) {
         presenter.viewWillAppear()
     }
     
     
    // MARK: - ConfigureData
    private func configureData(){
        view.addSubview(adoptingHeaderView)
        view.addSubview(collectionview)
        collectionview.snp.makeConstraints { make in
            make.top.equalTo(adoptingHeaderView.snp.bottom).offset(10)
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
        
        view.addSubview(tableViewActivityIndicator)
        tableViewActivityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: - CollectionViewDelegate
extension AdoptingHomeViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.categorNumberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
        
        let item  = presenter.categoryCellForItem(at: indexPath)
        cell.configureData(category: item.category)
        cell.layer.cornerRadius = item.cornerRadius
        cell.layer.borderWidth = item.borderWidth
        cell.layer.borderColor = item.borderColor.cgColor
        cell.backgroundColor = item.backColor
        cell.configureCategoryLabel(color: item.labelColor)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(at: indexPath)
    }
}


extension AdoptingHomeViewController : UITableViewDelegate,UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdvertTableViewCell.identifier, for: indexPath) as? AdvertTableViewCell else {return UITableViewCell()}
        let advert = presenter.cellForRowAt(at: indexPath)
        cell.configureData(advert: advert)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(at: indexPath)
    }
    
    
}

// MARK: - AdoptingHeaderViewDelegate
extension AdoptingHomeViewController : AdoptingHeaderViewDelegate {
    func selectedFilterButton() {
        presenter.toAdvertFilterController()
    }
    
    func searchTextFieldDidChange(text: String) {
        presenter.searchTextFieldDidChange(searchText: text)
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
    
    func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionview.reloadData()
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.advertTableView.reloadData()
        }
    }
    
    func startTableViewLoding() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableViewActivityIndicator.startAnimating()
        }
    }
    
    func finishTableViewLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableViewActivityIndicator.stopAnimating()
        }
        
    }
    
    func advertListMessage(isHidden:Bool,message:String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.advertTableView.isHidden = !isHidden
            self.messageLabel.isHidden = isHidden
            self.messageLabel.text = message
            
        }
    }
}
extension AdoptingHomeViewController : AdvertFilterControllerDelegate {
    func toAdoptingHomeViewControllerWithPopViewController(adoptingAdverts: [AdoptingAdvert]) {
       
    }
    
    
    
    
}













