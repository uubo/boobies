//
//  Card.h
//  Matchismo
//
//  Created by Влад Агиевич on 27.02.14.
//  Copyright (c) 2014 Владислав Агиевич. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChosen) BOOL chosen;

@property (nonatomic, readonly) NSUInteger cardsToMatch;

- (int)match:(NSArray *)otherCards;

@end
