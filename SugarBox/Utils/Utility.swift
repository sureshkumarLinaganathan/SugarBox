//
//  Utility.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import UIKit

extension String {
    
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: self)
        return date
    }
    
    var attributedString: NSAttributedString {
        let str = "<style>body{font-family:'HelveticaNeue'; font-size:16px}</style>\(self)"
        let data = str.data(using: String.Encoding.unicode)!
        let attrStr = try? NSMutableAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes:nil)
        return attrStr ?? NSAttributedString(string: self)
    }
    
    func toDisplyableDate() -> String {
        if let date = self.toDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            let resultString = dateFormatter.string(from: date)
            return resultString
        }
        return ""
    }
    
    func toDisplayableDays() -> Int {
        if let date = self.toDate {
            let diffInDays = Calendar.current.dateComponents([.day], from: date, to: Date()).day
            return diffInDays ?? 0
        }
        return 0
    }
}

extension UITableViewCell {
    public class func identifier() -> String {
        return String(describing: self)
    }
}

extension UIView{
    
    func makeRoundCorner(radius:CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}
