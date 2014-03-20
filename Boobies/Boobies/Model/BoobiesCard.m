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
        NSString *tit1Id = [BoobiesCard nameId:self.contents];
        NSString *tit2Id = [BoobiesCard nameId:[otherCards[0] contents]];
        NSString *tit1Kind = [BoobiesCard nameKind:self.contents];
        NSString *tit2Kind = [BoobiesCard nameKind:[otherCards[0] contents]];
        if ([tit1Id isEqualToString:tit2Id] &&
            ![tit1Kind isEqualToString:tit2Kind]) {
            score = 1;
        }
    }
    return score;
}

+ (NSString *)nameId:(NSString *)name
{
    return [name substringToIndex:name.length - 1];
}

+ (NSString *)nameKind:(NSString *)name
{
    return [name substringFromIndex:name.length - 1];
}

@end
