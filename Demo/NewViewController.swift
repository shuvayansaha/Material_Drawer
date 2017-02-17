//
//  NewViewController.swift
//  Demo
//
//  Created by Shuvayan Saha on 16/02/17.
//  Copyright © 2017 MagicMind Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class NewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var drawerImage: UIImageView!

    @IBOutlet weak var drawerTable: UITableView!
    
    @IBOutlet weak var moreTrailing: NSLayoutConstraint!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    
    @IBOutlet weak var navBar: UINavigationBar!

    var menuShowing1 = false
    var menuShowing2 = false

    var imageArray = [#imageLiteral(resourceName: "Cart"), #imageLiteral(resourceName: "ProfileDetails"), #imageLiteral(resourceName: "Products")]
    var labelArray = ["AA", "BB", "CC"]

    var people = [Person]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Table View Delagate
        drawerTable.delegate = self
        drawerTable.dataSource = self
        
        blackView.alpha = 0
        
        trailing.constant = view.frame.size.width
        moreTrailing.constant = 82
        
        self.navBar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 64)

        // Tap Gesture
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss)))
        
        // Tap Gesture
        mainView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleDismissMoreView)))
        
        // Swipe gesture
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture))
        
        // Gesture swipe left and right
        swipeGestureLeft.direction = .left
        swipeGestureRight.direction = .right
        
        view.addGestureRecognizer(swipeGestureLeft)
        view.addGestureRecognizer(swipeGestureRight)
        
        // Menu Function
        menu()
    }

    
    // MARK : - TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return people.count
        return 5

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.drawerTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! MenuTableViewCell
        
        //let person = people[indexPath.row]
        
      //  cell.menuImage.image = person.image
      //  cell.menuLabel.text = "aa"
        
        return cell
    }
    
    
    func menu() {
        
        let person = Person()

        person.image = imageArray[1]
        person.label = labelArray[0]
        
    }
    
    
//
//    // Prepare for segue to value pass to another controller
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if (segue.identifier == "detailVCToDescriptionVC") {
//            
//            let vc = segue.destination as! DescriptionVC
//            
//            // Selected Row data Pass to another controller
//            
//            let selectedRowIndex = self.detailsTable.indexPathForSelectedRow
//            
//            let person = self.people[selectedRowIndex!.row]
//            
//            vc.toPassAmount = person.amount
//            vc.toPassCreated = person.created_at
//            vc.toPassPayOrreceive = person.pay_or_receive_status
//            vc.toPassDescription = person.description
//            vc.toPassImageUrl = person.image_url
//            vc.toPassPhoneNo = toPassName
//            vc.toProfilePicture = toPassProfilePicture
//            
//        } else if (segue.identifier == "addNewSegue") {
//            
//            
//            // Data Pass to Transaction VC
//            
//            let viewCon = segue.destination as! TransactionVC
//            
//            viewCon.toPassPhoneNo = toPassPhone
//            viewCon.toPassPhoneName = toPassName
//            
//            
//        } else if (segue.identifier == "lockerSegue") {
//            
//            let viewCont = segue.destination as! SettlementLockerVC
//            
//            viewCont.toPassPhoneNo = toPassPhone
//            viewCont.toPassPhoneName = toPassName
//            
//            
//        }
//        
//    }
    
    
    
    
    
    
    
    // Tap to dismiss View
    func handleDismiss() {
        
        if menuShowing1 {
            
            trailing.constant = view.frame.size.width
            
            UIView.animate(withDuration: 0.3, animations: {
                self.blackView.alpha = 0
                self.view.layoutIfNeeded()
            })
            
            menuShowing1 = !menuShowing1
        }
        
    }
    
    // Tap to dismiss More View
    func handleDismissMoreView() {
        
        if menuShowing2 {
            
            moreTrailing.constant = 82
            
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing2 = !menuShowing2
        }
        
    }
    
  
    
    
    
    // Gesture function
    func handleGesture(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .left) {
            
            trailing.constant = view.frame.size.width
            
            UIView.animate(withDuration: 0.3, animations: {
                self.blackView.alpha = 0

                self.view.layoutIfNeeded()
            })
            
        } else if (sender.direction == .right) {
            
            trailing.constant = 90
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.blackView.alpha = 1

                self.view.layoutIfNeeded()
            })
            
        }
        
        menuShowing1 = !menuShowing1
        
        
        if menuShowing2 {
            
            moreTrailing.constant = 82
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
            
            menuShowing2 = !menuShowing2
        }
        
    }
    
    
    
    @IBAction func menuButton(_ sender: UIBarButtonItem) {
   
        menuShow()
        
        if menuShowing2 {
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.moreTrailing.constant = 82

                self.view.layoutIfNeeded()
            })
            
            menuShowing2 = !menuShowing2
        }
    }

   
    @IBAction func moreButton(_ sender: UIBarButtonItem) {
   
        moreShow()
        
        if menuShowing1 {
            
            trailing.constant = view.frame.size.width
            UIView.animate(withDuration: 0.3, animations: {
                
                self.blackView.alpha = 0
                
                self.view.layoutIfNeeded()
                
            })
           
            menuShowing1 = !menuShowing1

        }
    }
    
    
    // Menu Showing Function
    
    func menuShow() {
        
        if menuShowing1 {
            trailing.constant = view.frame.size.width

            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.blackView.alpha = 0

                self.view.layoutIfNeeded()
                
            })
            
        } else {
            
            trailing.constant = 90

            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.blackView.alpha = 1

                self.view.layoutIfNeeded()
                
            })
        }
        menuShowing1 = !menuShowing1
    }
    
    
    
    // More Showing Function
    
    func moreShow() {
        
        if menuShowing2 {
            moreTrailing.constant = 82
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
                
            })
            
        } else {
            
            moreTrailing.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                
                self.view.layoutIfNeeded()
                
            })
        }
        menuShowing2 = !menuShowing2
        
    }
    



}

// Person Class
class Person {
    
    var image = UIImage()
    var label = ""
    
}
