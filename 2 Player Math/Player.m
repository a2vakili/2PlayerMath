//
//  Player.m
//  2 Player Math
//
//  Created by Arsalan Vakili on 2015-08-10.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _numberOfLives = 3;
        _answerCorrectness = true;
    }
    return self;
}

@end
