//
//  MessageUserListPresenter.swift
//  MessageUserListModule
//
//  Created by engin gülek on 9.12.2023.
//

import Foundation

protocol MessageUserListPresenterInterface {
    var view : MessageUserListControlllerInterface? {get}
    
    func viewDidLoad()
}

class MessageUserListPresenter : MessageUserListPresenterInterface {
 
    
  weak var view: MessageUserListControlllerInterface?
    
    init(view: MessageUserListControlllerInterface?) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: .white)
        view?.navigationBackButtonHiddenAble(isHidden:true)
        view?.prepareTableView()
        view?.reloadTableView()
    }
}


