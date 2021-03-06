//
//  UIDevice+Opetopic.h
//  OPExtensionKit
//
//  Created by Brandon Williams on 11/28/10.
//  Copyright 2010 Opetopic. All rights reserved.
//

/** UIDevice Extensions
 
 Lots of fancy UIDevice extensions!
 */

#import <Foundation/Foundation.h>

@interface UIDevice (Opetopic)

+(BOOL) isGameCenterReady;
+(BOOL) isRetina;
+(BOOL) isPhone;
+(BOOL) isPad;
+(BOOL) isFast;
+(BOOL) hasFacetime;
+(BOOL) hasTelephony;
+(BOOL) isAtLeastiOS5;

+(double) freeMemory;
+(double) appMemoryUsage;

@end
