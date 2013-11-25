//
//  Deck.h
//  Matchismo
//
//  Created by Ajo Chope on 08/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject
- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;
@end
