//
//  StorageService.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import CoreData
import UIKit

final class StorageService {
    
}

extension StorageService: StorageReceiver {
    func fetch(for entity: String) -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entity(forEntityName: entity, in: managedContext)
        fetchRequest.entity = entityDescription
        return (try? managedContext.fetch(fetchRequest) as? [NSManagedObject]) ?? []
    }
    
}

extension StorageService: StorageSetter {
    func save(_ data: StorageEntity) {
        var managedObject = [NSManagedObject]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: data.title,in:context)
        let object = NSManagedObject(entity: entity!,insertInto: context)
        let dictionary = try? data.asDictionary()
        dictionary?.forEach{ object.setValue($0.value, forKey: $0.key) }
        try? context.save()
        managedObject.append(object)
    }
    
}

extension StorageService: StorageRemover {
    func removeData(for entity: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? context.execute(deleteRequest)
        try? context.save()
    }

}
