//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Ajo Chope on 06/07/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"
@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic) int flipsCount;
//Outlet collection, array que siempre es strong
// apunta a todo su contenido strong
// no tenemos control del orden de cada carta dentro del array
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (strong, nonatomic) Deck *deck;
// propiedad que apunta al model
@property (strong,  nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISwitch *swithGame;
@property (weak, nonatomic) IBOutlet UILabel *typeGameLabel;
@property (strong, nonatomic) GameResult *gameResult;
@end

@implementation CardGameViewController


-(GameResult *) gameResult
{
  if()
}

// lazy instatiation para game
-(CardMatchingGame *) game
{
     
    //
    // 
    if(!_game) _game =[[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                       usingDeck:[[PlayingCardDeck alloc]init]];
   
    
    
    return _game;
    

 
    
  //      self.typeGameLabel.text = [NSString stringWithFormat:@"3 Math Mode"];
    
    
}

/*
// lazy instatiation para Deck
-(Deck *) deck
{
    // tipos altos para declarar la clase
    // es la clase mas generica PlayingCardDeck
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
        
    return _deck;
}
*/

// el setter del array de la propiedad cardbuttons
-(void)setCardButtons:(NSArray *)cardButtons
{
    
    // asignacion valor a la variable
    _cardButtons = cardButtons;
    [self updateUI];
    
    
    /*
    // para cada carta del array vamos a darle un valor aleatorio
    for(UIButton *cardButton in self.cardButtons){
        // obtengo una carta aletoria
        Card *card = [self.deck drawRandomCard];
        // se la pongo en cada carta como title
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        
    }
    */
}


-(void) updateUI
{
    // recorro todos los botones y actualizo la vista
    for(UIButton *cardButton in self.cardButtons){
        // pido el valor y lo actualizo entre controlador y la vista
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        // actualizo el contenido de cada carta
        // que tiene ser actualizado para cada estado si no lo tiene usa el estado por estado normal
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        // para cuando esta la carta en el estado disabled
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled ];
        // miro si esta la carta boca arriba o boca abajo
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        // alpha es una palabra que significa transparencia cuando tenemos una pareja
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    
    
    if(self.swithGame.state){
        self.typeGameLabel.text = @"2 Math Mode";
    } else {
        self.typeGameLabel.text = @"3 Math Mode";
    }
    
    
}


-(void)setFlipsCount:(int)flipsCount
{
    _flipsCount = flipsCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips: %d" , self.flipsCount];
    NSLog(@"filps update to %d",self.flipsCount);
    
}

- (IBAction)flipCard:(UIButton *)sender
{
    //sender.selected = !sender.isSelected;
    [self.game flipCarAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipsCount++;
    [self updateUI];

}


@end
