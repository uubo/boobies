//
//  BoobiesCardDeck.m
//  Boobies
//
//  Created by Влад Агиевич on 18.03.14.
//  Copyright (c) 2014 uubo. All rights reserved.
//

#import "BoobiesCardDeck.h"
#import "BoobiesCard.h"

@implementation BoobiesCardDeck

- (instancetype)initWithImageNamesArray:(NSArray *)imageNames
{
    for (NSString *imageName in imageNames) {
        BoobiesCard *card = [[BoobiesCard alloc] init];
        card.contents = imageName;
        [self addCard:card];
    }
    return self;
}

@end
