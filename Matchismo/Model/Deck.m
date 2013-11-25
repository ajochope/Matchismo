//
//  Deck.m
//  Matchismo
//
//  Created by Ajo Chope on 08/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "Deck.h"


@interface Deck()
// MutableArray es una subclase de array que pudedes modificar el array
@property (strong, nonatomic)NSMutableArray *cards; // of Card
@end

@implementation Deck


- (NSMutableArray *)cards
{
    
    // el getter de cards,lazy instatiation, si se usa lo inicilaizamos
    // preguntamos si es nil el array y lo creamos prevenimos no trabajar
    // con un card que sea nil y lo queremos poner en el array  y daria error
    // alloc peticion de espacio en el heap
    // init la inicializacion del array
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    } else{
        [self.cards addObject:card];
    }
}
- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    // preguntamos si el array esta creado count dara algo distinto de cero
    if(self.cards.count){
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end
