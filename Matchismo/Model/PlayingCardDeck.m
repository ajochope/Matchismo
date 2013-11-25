//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Ajo Chope on 10/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init
{
    self = [super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]){
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:YES];
                
            }
            
        }
    }
    
    return self;
}

@end
