//
//  DatabaseManager.swift
//  ChatApp
//
//  Created by sourav_singh on 01/06/24.
//

import Foundation
import FirebaseDatabase


final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
}

// Account Management
    extension DatabaseManager {
        
        
        public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
            
            database.child(email).observeSingleEvent(of: .value, with: { snapshot in
                guard snapshot.value as? String != nil else {
                    return
                }
                completion(true)
            })
        }
        
    // insert new user in database
    public func insertUser(with user: ChatAppUser){
        database.child(user.emailaddress).setValue(["first_name": user.firstName,"last_name": user.lastName])
    }
}
    struct ChatAppUser {
        let firstName: String
        let lastName: String
        let emailaddress: String
//         let profilePictureUrl: String
    }
    
    

