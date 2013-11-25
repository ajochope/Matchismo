//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Ajo Chope on 29/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
@interface CardMatchingGame : NSObject
// esta clase es la logica del juego
// como se comporta el emparejamiento
// En MVC esta logica ve en el modelo


// designated initializer
//es la unica forma de saber cual el
// el inicilizador de esta clase
// inicilizo cardMatchingGame con un scenario lleno de info
-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;


// volteamos una carta y vemos si casa
// es la de mas trabajo
-(void)flipCarAtIndex:(NSUInteger)index;

// tomamos una carta que demos su indice
-(Card *)cardAtIndex:(NSUInteger)index;

// añado una propiedad publica de solo lectura
// para llevar los puntos 
@property  (readonly, nonatomic) int score;


@end
