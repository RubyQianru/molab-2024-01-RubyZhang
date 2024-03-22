//
//  Extensions.swift
//  Audio-App
//
//  Created by qianru zhang on 2024/3/11.
//

import Foundation


extension Date
{
    func toString(dateFormat format: String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

}
