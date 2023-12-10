
import Foundation
import UIKit
import MessageKit


struct Sender:SenderType {
    let senderId : String
    let displayName:String
}

struct Message : MessageType {
    let sender:SenderType
    let messageId:String
    var sentDate:Date
    var kind:MessageKind
}


final class ChatViewController : MessagesViewController,MessagesDataSource,MessagesLayoutDelegate,MessagesDisplayDelegate {
 

    let currentSender: SenderType = Sender(senderId: "1", displayName: "Adam Da")
    let otherSender :  SenderType = Sender(senderId: "2", displayName: "Elen Sa")
    var messages = [MessageType]()
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        messages.append(Message(
            sender: currentSender,
            messageId: "1",
            sentDate: Date().addingTimeInterval(-86400),
            kind: .text("Hello World")))
        
        messages.append(Message(
            sender: otherSender,
            messageId: "2",
            sentDate: Date().addingTimeInterval(-56400),
            kind: .text("Hi")))
        
        
        messages.append(Message(
            sender: currentSender,
            messageId: "3",
            sentDate: Date().addingTimeInterval(-26400),
            kind: .text("I have a quentions")))
        
        messagesCollectionView.reloadData()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}




