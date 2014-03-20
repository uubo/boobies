//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Влад Агиевич on 28.02.14.
//  Copyright (c) 2014 Владислав Агиевич. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) BOOL gameFinished;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (instancetype)init
{
    return nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    int matchScore = 0;
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            card.chosen = YES;
        }
    }
    [self checkIfGameFinished];
}

- (void)checkIfGameFinished
{
    self.gameFinished = YES;
    for (Card *card in self.cards) {
        if (!card.isMatched) {
            self.gameFinished = NO;
            break;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
