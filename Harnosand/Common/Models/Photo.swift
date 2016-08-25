//
//  Photo.swift
//  Harnosand
//
//  Created by Muhammed Said Özcan on 25/08/16.
//  Copyright © 2016 Muhammed Said Özcan. All rights reserved.
//

import Foundation
import Unbox

struct Photo: Unboxable{
    let identifier: String
    let owner: String
    let title: String
    let dateTaken: NSDate?
    let media: String
    let url: NSURL?
    
    init(unboxer: Unboxer) {
        self.identifier = unboxer.unbox("id")
        self.owner = unboxer.unbox("owner")
        self.title = unboxer.unbox("title")
        self.media = unboxer.unbox("media")
        if let url:String = unboxer.unbox("url_l"){
            self.url = NSURL(string: url)
        }else{
            self.url = nil
        }
        self.dateTaken = unboxer.unbox("datetaken", formatter:CachedDateFormatter.sharedInstance.formatterWith("YYYY-MM-dd HH:mm:ss"))
    }
}