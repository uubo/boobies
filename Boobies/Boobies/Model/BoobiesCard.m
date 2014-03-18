//
//  BoobiesCard.m
//  Boobies
//
//  Created by Влад Агиевич on 18.03.14.
//  Copyright (c) 2014 uubo. All rights reserved.
//

#import "BoobiesCard.h"

@implementation BoobiesCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        if ([self.contents isEqualToString:[otherCards[0] contents]]) {
            score = 1;
        }
    }
    return score;
}

@end
