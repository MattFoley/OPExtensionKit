//
//  NSManagedObjectContext+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/4/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** NSManagedObjectContext Extensions
 
 Lots of fancy NSManagedObjectContext extensions!
 */

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Opetopic)

/**
 Finds an NSManagedObject from its permanent URI (see http://cocoawithlove.com/2008/08/safely-fetching-nsmanagedobject-by-uri.html )
 */
-(NSManagedObject*) objectWithURI:(NSURL*)uri;

@end
