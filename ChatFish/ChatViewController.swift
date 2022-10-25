//
//  ChatViewController.swift
//  ChatFish
//
//  Created by Michelle Tan on 10/17/22.
//

import UIKit
import MessageKit
import Parse

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    
}
class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate,
                          MessagesDisplayDelegate{
    
    let currentUser = Sender(senderId: "self", displayName: "Fish_Chat Group")
    
    let otherUser = Sender(senderId: "other", displayName: "John Smith")
    
    var messages = [MessageType]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: currentUser, messageId: "1",
                                sentDate: Date().addingTimeInterval(-76400),
                                kind: .text("Hello World")))
        
        messages.append(Message(sender: otherUser, messageId: "2",
                                sentDate: Date().addingTimeInterval(-66400),
                                kind: .text("How is it going ")))
        
        messages.append(Message(sender: currentUser, messageId: "3",
                                sentDate: Date().addingTimeInterval(-56400),
                                kind: .text("Here is all good, here is long reply")))
        
        messages.append(Message(sender: currentUser, messageId: "4",
                                sentDate: Date().addingTimeInterval(-46400),
                                kind: .text("Look it works")))
        
        
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self

        // Do any additional setup after loading the view.
    }
    
    func currentSender() -> MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }

    
   
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
