//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Влад Агиевич on 28.02.14.
//  Copyright (c) 2014 Владислав Агиевич. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@end
