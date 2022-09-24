//
//  NSManagedObjectContext.swift
//  Games
//
//  Created by HIS nutech on 15/09/22.
//

import UIKit
import CoreData

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        let appDelagate = PersistenceController()
        return appDelagate.container.viewContext
    }
}
