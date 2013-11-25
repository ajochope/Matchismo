//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Ajo Chope on 29/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "CardMatchingGame.h"
// Se llama Class Extension va con los parentesis

@interface CardMatchingGame()
// readwrite es el valor pordefecto pero como
// en la parte publica el .h es solo lectura
// aqui se modifica para hacer el conteo del marcador
@property(readwrite, nonatomic) int score;

// un array de cartas que contine las cartas
// que van jugar se iniciliza en initwithCardCount
// el array se comenta el contenido del array de objective-c pueden tener lo que sea dentro
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end


@implementation CardMatchingGame


// lazy instantiation para el array
// pra que en el peor caso devuelva un array vacio
// y no nil y el pgm se estrella
-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    //Con esto solo valdria para devolver una carta del array
    // pero se pone una comprobacion para el caso que
    // el valor que nos pasan de argumento el index
    // sea mayor que la longitud de nuestra baraja
    return (index < [self.cards count]) ? self.cards[index]: nil;
}


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST -1

// el metodo donde tiene la logico de emparejar cartas
-(void)flipCarAtIndex:(NSUInteger)index
{
    // tomamos una carta
    Card *card = [self cardAtIndex:index];
    // si no esta vacia y si no es injugable
    if(card && !card.isUnplayable){
        if(!card.isFaceUp){
        // recorremos el array de cartas
            for(Card *otherCard in self.cards){
                // buscamos 
                if(otherCard.isFaceUp && !otherCard.isUnplayable){
                    // encuentro una y apunto tantos
                    // cuidado  con @[] es para no error de tipos
                    // entre array y mutablearray
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        // encuentro coincidencia
                        // actulaizo estado y puntuacion con bonus
                        card.Unplayable = YES;
                        otherCard.Unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        // seleciono pero no es lo que busco
                        // no la doy la vueta y
                        // si que penalizo no ser lo que busco
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
            
        }
        self.score -= FLIP_COST;
            
    }
        
    card.FaceUp = !card.isFaceUp;
 }
    
    
}


-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck
{
    // llamda al padre init como regla
    // el inicilizador conveniente
    self = [super init];
    // preguntamos al padre si va todo ok
    // en la inicializacion y si ok
    // dentro del if rellenamos todas las cartas del juego
    // en un array interno
    if(self){
        // count el parametro que pasan de inicilizacion para el for
        for(int i = 0; i< count; i++){
            // el deck que nos pasan de argumento de inicilializacion
            Card *card = [deck drawRandomCard];
            // preguntamos si card no esta vacio
            // puede pasar count = 100 y no hay mas que 52 cartas
            // debemos comprobar ese caso y salir del for con
            // init correcto o con con un break y devolviendo nil como inicializacion
            if(card){
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

@end
