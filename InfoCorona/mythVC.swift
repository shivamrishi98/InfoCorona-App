//
//  mythVC.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 26/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//

import UIKit

class mythVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var sourceLabel: UILabel!
    
    let info : [String] = ["Cold weather and snow CANNOT kill the new coronavirus.","Hand dryers are not effective in killing the 2019-nCoV","COVID-19 virus can be transmitted in areas with hot and humid climates","Garlic is a healthy food but there is no evidence from the current outbreak that eating garlic has protected people from the new coronavirus","The coronavirus CANNOT be transmitted through mosquito bites.","Thermal scanners CAN detect if people have a fever but CANNOT detect whether or not someone has the coronovirus","Antibiotics DO NOT work against viruses, antibiotics only work against bacteria","There is no evidence that companion animals/pets such as dogs or cats can transmit the coronavirus","Spraying alcohol or chlorine all over your body WILL NOT kill viruses that have already entered your body","To date, there is NO specific medicine recommended to prevent or treat the coronavirus"]
    
    let img = ["snow.png","hand-dryer.png","sun.png","garlic","mosquito","thermal","drug","dog","alcohol","doctor"]
    
    override func viewDidLoad() {
           super.viewDidLoad()
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                
                sourceLabel.textColor =  .lightGray
            }
        } else {
            // Fallback on earlier versions
        }
//               self.TableView.tableFooterView = UIView()
          
       }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mythCell", for: indexPath ) as! mythTableViewCell
        cell.infoLabel.text = self.info[indexPath.row]
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
               
                    
                
                 cell.infoLabel.textColor = .white
               
            } else
            {
                cell.infoLabel.textColor = .black
            }
        } else {
            // Fallback on earlier versions
        }
        cell.infoImg.image = UIImage(named: img[indexPath.row])
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    

}
