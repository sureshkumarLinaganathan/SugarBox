//
//  Parser.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import Foundation

class Parser{
    
    class func decode <T: Decodable> (data:Data, type: T.Type) -> AnyObject {
        
        do{
            let decodeObj  = try JSONDecoder().decode(type.self, from: data)
            return decodeObj as AnyObject
        }catch {
            print(error.localizedDescription)
            return [] as AnyObject
        }
    }
}

    
