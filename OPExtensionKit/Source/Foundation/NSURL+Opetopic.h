//
//  NSURL+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 12/1/11.
//  Copyright (c) 2011 Opetopic. All rights reserved.
//

/** NSURL Extensions
 
 Lots of fancy NSURL extensions!
 */

#import <Foundation/Foundation.h>

#define $url(string)    [NSURL URLWithString:string]

@interface NSURL (Opetopic)

-(NSDictionary*) queryParameters;

@end
