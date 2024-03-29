//
//  PlayingCard.h
//  Matchismo
//
//  Created by Griggs, Ken on 3/4/14.
//  Copyright (c) 2014 Griggs, Ken. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
