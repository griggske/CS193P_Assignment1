//
//  Deck.h
//  Matchismo
//
//  Created by Griggs, Ken on 3/4/14.
//  Copyright (c) 2014 Griggs, Ken. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
