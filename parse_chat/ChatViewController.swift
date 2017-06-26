//
//  ChatViewController.swift
//  parse_chat
//
//  Created by Cameryn Boyd on 6/26/17.
//  Copyright © 2017 Cameryn Boyd. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    var messageArray: [PFObject]?
    
    var refreshTimer: Timer!
    
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message_fbu2017")
        
        chatMessage["text"] = messageTextField.text ?? ""
        
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.messageTextField.text = ""
            } else if let error = error {
                print("prpblem saving message : \(error.localizedDescription)")
            }
        }
    }
    
    
    
    func refresh() {
        print("refresh")
        
        var query = PFQuery(className: "Message_fbu2017")
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
            self.messageArray = messages
                print(messages?[0])
        }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.refresh), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! ChatCell
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
