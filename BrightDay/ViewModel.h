//
//  ViewModel.h
//  BrightDay
//
//  Created by David Beleza on 12/07/16.
//  Copyright © 2016 David Beleza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

- (void)getNextLotteryDateFromDate:(NSDate*)date afterCompletion:(void(^)(NSString*date))completion;

@end
