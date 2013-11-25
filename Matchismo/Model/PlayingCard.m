//
//  PlayingCard.m
//  Matchismo
//
//  Created by Ajo Chope on 10/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// comprobamos si coincide palo o numero suit o rank
// y damos una puntuacion para cada caso
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    // miramos solo si tenemos una sola carta que comparar
    if([otherCards  count] == 1){
        // mejor usar id
        id otherCard = [otherCards lastObject];
        if([otherCard isKindOfClass:[PlayingCard class]]){
            // el casting de comunicacion extra del tipo para mejor lectura
            PlayingCard *otherPlayingCard = (PlayingCard *) otherCard;
            
            if([otherPlayingCard.suit isEqualToString:self.suit]){
                
                score = 1;
                
            } else if(otherPlayingCard.rank == self.rank){
                
                score = 4;
                
            }
            
        }
        
        /*
        // lastObject no da error si esta vacio solo devuelve nil
        // y asumimos que tiene dentro objetos tipo Card
        // nos devuelden id desde othercards lastobject
        PlayingCard  *otherCard = [otherCards lastObject];
        
        
        
        if([otherCard.suit isEqualToString:self.suit]){
        
            score = 1;
            
        } else if(otherCard.rank == self.rank){
            
            score = 4;
            
        }
        */
    }
    return score;
}


- (NSString *)contents
{
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
    
}

// porque ponemos el setter y getter debemos declarar esta variable
@synthesize suit = _suit;

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    
    
    //    Clase       Metodo    : metoddel array:objeto a compa 
    if ([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}


// este metodo lleva el mas porque es metodo de la clase PlayingCard
// mas abajo se usa en el set suit de la forma nombre clase nombre metodo
+ (NSArray *)validSuits
{
    static NSArray *validSuits = nil;
    if(!validSuits){
        // este @[ crear un array on the fly
        validSuits = @[@"♥",@"♦",@"♠",@"♣"];
    }
    return validSuits;
}

+ (NSArray *)rankStrings
{
    static NSArray *rankStrings = nil;
    if(!rankStrings){
        rankStrings = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    }
    return rankStrings;
}


+ (NSUInteger)maxRank
{
    // con self rankString llamamos al metodo de la clase PlayingCard
    return [self rankStrings].count-1;
}


- (void)setRank:(NSUInteger)rank
{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}


@end