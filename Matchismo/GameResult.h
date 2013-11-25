//
//  GameResult.h
//  Matchismo
//
//  Created by Ajo Chope on 20/08/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults; // of GameResults

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
