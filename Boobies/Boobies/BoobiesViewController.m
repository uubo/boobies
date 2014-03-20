//
//  BoobiesViewController.m
//  Boobies
//
//  Created by Влад Агиевич on 18.03.14.
//  Copyright (c) 2014 uubo. All rights reserved.
//

#import "BoobiesViewController.h"
#import "FullScreenViewController.h"
#import "BoobiesCard.h"
#import "BoobiesCardDeck.h"
#import "CardMatchingGame.h"

@interface BoobiesViewController ()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *winMessageLabel;
@end

@implementation BoobiesViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (Deck *)createDeck //abstract
{
    return [[BoobiesCardDeck alloc] initWithImageNamesArray:[self validImageNames]];
}

- (NSArray *)validImageNames
{
    return @[@"tit1L", @"tit1R", @"tit2L", @"tit2R", @"tit3L", @"tit3R", @"tit4L", @"tit4R",
             @"tit5L", @"tit5R", @"tit6L", @"tit6R", @"tit7L", @"tit7R", @"tit8L", @"tit8R",
             @"tit9L", @"tit9R", @"tit10L", @"tit10R", @"tit11L", @"tit11R", @"tit12L", @"tit12R"];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    BOOL justMatched = NO;
    NSString *imageToShowFullScreen;
    for (int i = 0; i < [self.cardButtons count]; i++) {
        UIButton *cardButton = self.cardButtons[i];
        Card *card = [self.game cardAtIndex:i];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        if (cardButton.enabled && card.isMatched) {
            justMatched = YES;
            imageToShowFullScreen = [BoobiesCard nameId:card.contents];
            cardButton.enabled = NO;
        }
    }
    [self winMessage];
    
    if (justMatched) {
        [self performSegueWithIdentifier:@"fullScreen"
                                  sender:imageToShowFullScreen];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"fullScreen"]) {
        FullScreenViewController *fsvc = (FullScreenViewController *)segue.destinationViewController;
        fsvc.imageToShowName = (NSString *)sender;
    }
}

- (void)winMessage
{
    if (self.game.gameFinished) {
        self.winMessageLabel.text = @"You win!";
    }
}


- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? card.contents : @"cardback"];
}

@end
