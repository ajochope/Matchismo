//
//  Card.h
//  Matchismo
//
//  Created by Ajo Chope on 08/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end
