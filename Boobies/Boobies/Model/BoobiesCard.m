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
        NSString *titId1 = [self.contents substringToIndex:self.contents.length - 1];
        NSString *titId2 = [[otherCards[0] contents] substringToIndex:[[otherCards[0] contents] length] - 1];
        NSString *titKind1 = [self.contents substringFromIndex:self.contents.length - 1];
        NSString *titKind2 = [[otherCards[0] contents] substringFromIndex:[[otherCards[0] contents] length] - 1];
        if ([titId1 isEqualToString:titId2] &&
            ![titKind1 isEqualToString:titKind2]) {
            score = 1;
        }
    }
    return score;
}

@end
