//
//  dataModel.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 25/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//

import Foundation



struct dataModel : Decodable
{
 
    let latest_stat_by_country : [Latest_stat_by_country]

}

struct Latest_stat_by_country : Decodable{
    let total_cases :String
    let active_cases:String
    let total_recovered:String
    let total_deaths:String
}



