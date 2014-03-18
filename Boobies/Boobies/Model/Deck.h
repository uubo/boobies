//
//  Deck.h
//  Matchismo
//
//  Created by Влад Агиевич on 27.02.14.
//  Copyright (c) 2014 Владислав Агиевич. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
