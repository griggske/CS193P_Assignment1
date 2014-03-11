//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Griggs, Ken on 3/2/14.
//  Copyright (c) 2014 Griggs, Ken. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardGameViewController

// getter for the deck property - lazy instantiation
- (Deck *)deck
{
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
    
}

// this method updates the flipCount label in the UT via the Outlet
- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    // update the label
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    // toss an entry into the log just for fun
    NSLog(@"flipCount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) { // card face is up
        // flip it over to the back
        [sender setBackgroundImage:[UIImage imageNamed:@"CardBack"]
                          forState:UIControlStateNormal];
        // clear out the label text
        [sender setTitle:@"" forState:(UIControlStateNormal)];

    } else { // card back is up
        // flip it over to the face
        [sender setBackgroundImage:[UIImage imageNamed:@"CardFront"]
                          forState:UIControlStateNormal];
        //grab the next card from the deck
        Card *card = [self.deck drawRandomCard];
        if (card){ // we still have cards left in the deck
            // show the card we just got
            [sender setTitle:card.contents forState:(UIControlStateNormal)];
        } else { // no more cards, so just hardcode "Done" and lock the "card"
            [sender setTitle:@"Done" forState:(UIControlStateNormal)];
            [sender setUserInteractionEnabled:(false)];
        }
 
        
    }
    // don't forget to keep counting the flips
    self.flipCount++;
}

@end
