//
//  NotificationViewController.swift
//  NotificationExtension
//
//  Created by Kc on 17/09/2016.
//  Copyright © 2016 Kenechi Okolo. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = #imageLiteral(resourceName: "Aladdin-Thinking-GIF.gif")
        
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        switch response.actionIdentifier {
        case "answerOne":
            imageView.image = UIImage(named: "wrong")
            
        case "answerTwo":
            imageView.image = UIImage(named: "correct")
        case "clue":
            let alert = UIAlertController(title: "Hint", message: "The answer is greater than 29", preferredStyle: .alert)
            let action = UIAlertAction(title: "Thanks!", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        default:
            break
        }
        
        completion(.doNotDismiss)

    }

}
