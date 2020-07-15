
//
//  dm.swift
//  InfoCorona
//
//  Created by Shivam Rishi on 26/03/20.
//  Copyright © 2020 Shivam Rishi. All rights reserved.
//

import Foundation

struct dm: Decodable
{
    var stat_by_country : [stat_by_country]
}

struct stat_by_country : Decodable{
    var total_cases : String
    let record_date : String
}
