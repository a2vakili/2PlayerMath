//
//  GameModel.m
//  2 Player Math
//
//  Created by Arsalan Vakili on 2015-08-10.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "GameModel.h"

@interface GameModel ()



@end


@implementation GameModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _player1 = [[Player alloc]init];
        _player2 = [[Player alloc]init];
        _currentPlayer = _player1;
        _playerTurn = 1;
        _randomSign = @"+";
        [self randomize];
    }
    return self;
}



-(void)randomize {
    self.randomNumber2 = [self generateRandomNumber];
    self.randomNumber1 = [self generateRandomNumber];
    self.playerChosenNumber = 0;
}


-(int)generateRandomNumber{
    // generating random numbers
    
    int randomNumber = arc4random_uniform(20) + 1;
    return randomNumber;
}


-(int)calculateNumber{
    if ([self.randomSign isEqualToString:@"/"]) {
        return self.randomNumber1 / self.randomNumber2;
    }
    else if ([self.randomSign isEqualToString:@"-"]){
        return self.randomNumber1 - self.randomNumber2;
    }
    else if ([self.randomSign isEqualToString:@"*"]){
        return self.randomNumber1 * self.randomNumber2;
    }
    return self.randomNumber1 + self.randomNumber2;
}


-(int)scoreUpdate{
    if (self.playerChosenNumber != [self calculateNumber] ) {
        self.currentPlayer.numberOfLives--;
        NSLog(@"Player: %@ number of lives: %d", self.currentPlayer, self.currentPlayer.numberOfLives);
        if (self.currentPlayer.numberOfLives  < 0) {
            self.currentPlayer.numberOfLives = 3;
        }
    }
    return self.currentPlayer.numberOfLives;
}

- (void)swapPlayers {
    // Ternary operation
    //self.currentPlayer = self.currentPlayer == self.player1 ?  self.player2 : self.player1;
    
    if (self.currentPlayer == self.player1) {
        self.currentPlayer = self.player2;
        self.playerTurn = 2;
    } else {
        self.currentPlayer = self.player1;
        self.playerTurn = 1;
    }
}

-(void)randomsignGenerator{
    NSArray *randomValues = @[@"-", @"+", @"*",@"/"];
     int random = (int)arc4random_uniform(3);
    self.randomSign = randomValues[random];
}
@end
