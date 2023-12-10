//
//  MessageUserListPresenter.swift
//  MessageUserListModule
//
//  Created by engin gülek on 9.12.2023.
//

import Foundation

protocol MessageUserListPresenterInterface {
    var view : MessageUserListControlllerInterface? {get}
    var router : MessageUserListRouterInterface? {get}
    
    func viewDidLoad()
    func didSelect()
}

class MessageUserListPresenter : MessageUserListPresenterInterface {
    var router: MessageUserListRouterInterface?
    
    
  weak var view: MessageUserListControlllerInterface?
    
    init(view: MessageUserListControlllerInterface?,router:MessageUserListRouterInterface? = nil) {
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden:true)
        view?.prepareTableView()
        view?.reloadTableView()
    }
    
    func didSelect() {
        router?.toChat(view: view)
    }
}


