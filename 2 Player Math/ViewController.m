//
//  ViewController.m
//  2 Player Math
//
//  Created by Arsalan Vakili on 2015-08-10.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"

@interface ViewController ()

@property(nonatomic,assign) int number;

@property (weak, nonatomic) IBOutlet UILabel *playerQuestionLabel;
@property(nonatomic,strong) GameModel *gameModel;

@property (weak, nonatomic) IBOutlet UILabel *player1ScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *player2ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameOverLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // we allocate the new memory of object
    self.gameModel = [[GameModel alloc]init];
    
    // setting the players score at the beginning to be 3
    self.player1ScoreLabel.text = @"Player 1 score: 3";
    self.player2ScoreLabel.text = @"Player 2 score: 3";
    
    [self addNumbers:0];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Adding Buttons to display the number we creat on the label

- (IBAction)num1Button:(id)sender {
    [self addNumbers:1];
}
- (IBAction)num2Button:(id)sender {
    [self addNumbers:2];
}
- (IBAction)num3Button:(id)sender {
    [self addNumbers:3];
}

- (IBAction)num4Button:(id)sender {
    [self addNumbers:4];
}

- (IBAction)num5Button:(id)sender {
    [self addNumbers:5];
}


- (IBAction)num6Button:(id)sender {
    [self addNumbers:6];
}

- (IBAction)num7Button:(id)sender {
    [self addNumbers:7];
}

- (IBAction)num8Button:(id)sender {
    [self addNumbers:8];
}
- (IBAction)num9Button:(id)sender {
    [self addNumbers:9];
}

- (IBAction)num0Button:(id)sender {
    [self addNumbers:0];
}


- (IBAction)answerButton:(id)sender {
    
    
    int score = [self.gameModel scoreUpdate];
    
    //[self addNumbers:self.gameModel.playerChosenNumber];
    //getting the update score of current player
    
    if ([self.gameModel.player1 isEqual:self.gameModel.currentPlayer ]) {
        
        NSString *scorePlayer1 = [NSString stringWithFormat:@"Player 1 score: %i",score];
        self.player1ScoreLabel.text = scorePlayer1;
    }
    
    if ([self.gameModel.player2 isEqual:self.gameModel.currentPlayer]) { // if player 2 we set the label of current score
        NSString *scoreplayer2 = [NSString stringWithFormat:@"Player 2 score: %i",score];
        self.player2ScoreLabel.text = scoreplayer2;
    }
    
    [self.gameModel randomize];
    
    [self.gameModel swapPlayers];
    [self.gameModel randomsignGenerator];
    
    [self updateView];
    
    
    if (self.gameModel.currentPlayer.numberOfLives == 0) {
        self.gameOverLabel.text = @"Player has lost";
    }
    
    
}


-(void)addNumbers:(int)num{
    
    
    
    // making a player's chosen number from 1 to 2 digit numbers.
    
    if (self.gameModel.playerChosenNumber < 10)
    {
        self.gameModel.playerChosenNumber *= 10;
        self.gameModel.playerChosenNumber += num;
        
    }   // making a player's chosen number from 2 to 3 digits.
    else if (self.gameModel.playerChosenNumber < 100 && self.gameModel.playerChosenNumber >= 10) {
        self.gameModel.playerChosenNumber *= 10;
        self.gameModel.playerChosenNumber+= num;
    }
    else {
        self.gameModel.playerChosenNumber = num;
    }
    
    
    [self updateView];
    
}


-(void)updateView{
    
    // setting up the game models player's turn random numbers and setting up the gamemodel the player's chosen number.
    
    
    NSString *questionLabelString = [NSString stringWithFormat:@"player(%i): %i %@ %i = %i",self.gameModel.playerTurn,self.gameModel.randomNumber1,self.gameModel.randomSign,self.gameModel.randomNumber2, self.gameModel.playerChosenNumber];
    self.playerQuestionLabel.text = questionLabelString;
}


@end
