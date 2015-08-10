//
//  GameModel.h
//  2 Player Math
//
//  Created by Arsalan Vakili on 2015-08-10.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameModel : NSObject

@property(nonatomic,strong) Player *player1;
@property(nonatomic,strong) Player *player2;
@property (nonatomic, strong) Player *currentPlayer;

@property(nonatomic) int randomNumber1;
@property(nonatomic) int randomNumber2;
@property(nonatomic) int playerTurn;

@property(nonatomic) int playerChosenNumber;



-(int)generateRandomNumber;

-(int)calculateNumber;

-(int)scoreUpdate;

-(void)randomize;

- (void)swapPlayers;

@end
