//
//  PlayingCard.h
//  Matchismo
//
//  Created by Ajo Chope on 10/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
// los palos de la baraja
@property (strong, nonatomic) NSString *suit;
// entre 0 y 52 total de cartas
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
