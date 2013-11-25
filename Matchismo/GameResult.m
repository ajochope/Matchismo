//
//  GameResult.m
//  Matchismo
//
//  Created by Ajo Chope on 20/08/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()
@property (readwrite, nonatomic) NSDate *start;
@property (readwrite, nonatomic) NSDate *end;

@end


@implementation GameResult


// es la unica clave que guardamos en memoria de -NSUserDefaults
#define ALL_RESULTS_KEY @"GameResult_All"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

+(NSArray *)allGameResults
{
    NSMutableArray *allGameResults = [[NSMutableArray alloc]init];
    // iteramos todos los valores del diccionario
    for(id plist in [[[NSUserDefaults standardUserDefaults]dictionaryForKey:ALL_RESULTS_KEY] allValues]){
        GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    return allGameResults;
}

// init de conveniencia
-(id)initFromPropertyList:(id)plist
{
    self = [self init];
    if(self){
        if([plist isKindOfClass:[NSDictionary class]]){
            NSDictionary *resultDictionary = (NSDictionary *)plist;
            _start = resultDictionary[START_KEY];
            _end = resultDictionary[END_KEY];
            _score = [resultDictionary[SCORE_KEY] intValue];
            if(!_start || !_end) self = nil;
            
        }
    }
    return self;
}

-(void)synchronize
{
    // almaceno los datos en un diccionario con clave unica
    // date started y valores una lista de propiedades de datos del juego
    NSMutableDictionary *mutableGameResultsFromUserDefaults =
    [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    
    //  mutableCopy para que podamos sacar de NSUserDefaults es unmutable por defecto
    
    if(!mutableGameResultsFromUserDefaults){
        
        mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc ]init];
    }
    mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];
    // asPropertyList es un metodo que devuelve el resultado del jjuego a la lista de propiedades
    // la idea de manejar NSUserDefaults es sacas el valor, lo copias, lo modificas y lo insertas ya modificado y sincronizo
    
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
}



-(id)asPropertyList
{
    return @{START_KEY : self.start, END_KEY : self.end, SCORE_KEY : @(self.score)};
    

}

// designated initializer
- (id)init
{
    self = [super init];
    if(self){
        _start = [NSDate date];
        _end = _start;
        // al estar dentro de un init hay que hacerlo asi
        // todavia no estan los setter y getter cuidado!!!
    }
    return self;
}

- (NSTimeInterval)duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

- (void)setScore:(int)score
{
    _score = score;
    self.end = [NSDate date];
    // una forma de guardar los datos del juego de forma permanente
    // este metodo guarda en memoria es una: property list
    [self synchronize];
}


@end
