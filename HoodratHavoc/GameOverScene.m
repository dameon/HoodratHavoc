 //
//  GameOverScene.m
//  HoodratHavoc
//
//  Created by Dameon Bryant on 10/1/13.
//  Copyright (c) 2013 Dameon Bryant. All rights reserved.
//

#import "GameOverScene.h"
#import "MyScene.h"
#import "MyScene2.h"
#import "MyScene3.h"
#import <Foundation/Foundation.h>

int gameLevel;

@implementation GameOverScene

//@synthesize gameLevel;

-(id)initWithSize:(CGSize)size won:(BOOL)won {
    if (self = [super initWithSize:size]) {
        
        // 1
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        // 2
        NSString * message;
        if (won) {
            gameLevel ++;
            message = @"Heck Yeah, You Won!";
            SKLabelNode *nextLevelLabel;
            nextLevelLabel = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
            nextLevelLabel.name = @"nextLevelLabel";
            nextLevelLabel.text = @"Play Next Level?";
            nextLevelLabel.scale = 0.5;
            nextLevelLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.4);
            nextLevelLabel.fontColor = [SKColor blackColor];
            [self addChild:nextLevelLabel];
        } else {
            message = @"Heck NO You Lose!";
            SKLabelNode *restartLabel;
            restartLabel = [[SKLabelNode alloc] initWithFontNamed:@"Chalkduster"];
            restartLabel.name = @"restartLabel";
            restartLabel.text = @"Play Again?";
            restartLabel.scale = 0.5;
            restartLabel.position = CGPointMake(self.frame.size.width/2, self.frame.size.height * 0.4);
            restartLabel.fontColor = [SKColor blackColor];
            [self addChild:restartLabel];
        }
        
        // 3
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        label.text = message;
        label.fontSize = 40;
        label.fontColor = [SKColor blackColor];
        label.position = CGPointMake(self.size.width/2, self.size.height/2);
        [self addChild:label];
        
        // 4
//        [self runAction:
//         [SKAction sequence:@[
//                              [SKAction waitForDuration:3.0],
//                              [SKAction runBlock:^{
//             // 5
//             SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
//             SKScene * myScene = [[MyScene alloc] initWithSize:self.size];
//             [self.view presentScene:myScene transition: reveal];
//         }]
//                              ]]
//         ];
        
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (UITouch *touch in touches) {
        SKNode *n = [self nodeAtPoint: [touch locationInNode:self]];
        if (n !=self && [n.name isEqual:@"restartLabel"] && gameLevel == 0){
            [[self childNodeWithName:@"restartLabel"] removeFromParent];
            [[self childNodeWithName:@"winLoseLabel"] removeFromParent];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * myScene = [[MyScene alloc] initWithSize:self.size];
            [self.view presentScene:myScene transition: reveal];
            return;
        }
        else if (n !=self && [n.name isEqual:@"nextLevelLabel"] && gameLevel == 1)
        {
            //gameLevel = 2;
            [[self childNodeWithName:@"nextLevelLabel"] removeFromParent];
            [[self childNodeWithName:@"winLoseLabel"] removeFromParent];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * myScene2 = [[MyScene2 alloc] initWithSize:self.size];
            [self.view presentScene:myScene2 transition: reveal];
            return;
        }
        else if (n !=self && [n.name isEqual:@"restartLabel"] && gameLevel == 1)
        {
            //gameLevel = 2;
            [[self childNodeWithName:@"nextLevelLabel"] removeFromParent];
            [[self childNodeWithName:@"winLoseLabel"] removeFromParent];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * myScene2 = [[MyScene2 alloc] initWithSize:self.size];
            [self.view presentScene:myScene2 transition: reveal];
            return;
        }
       else if (n !=self && [n.name isEqual:@"nextLevelLabel"] && gameLevel == 2)
        {
            //gameLevel = 3;
            [[self childNodeWithName:@"nextLevelLabel"] removeFromParent];
            [[self childNodeWithName:@"winLoseLabel"] removeFromParent];
            SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
            SKScene * myScene3 = [[MyScene3 alloc] initWithSize:self.size];
            [self.view presentScene:myScene3 transition: reveal];
            return;
        }
       else if (n !=self && [n.name isEqual:@"restartLabel"] && gameLevel == 2)
       {
           //gameLevel = 3;
           [[self childNodeWithName:@"nextLevelLabel"] removeFromParent];
           [[self childNodeWithName:@"winLoseLabel"] removeFromParent];
           SKTransition *reveal = [SKTransition flipHorizontalWithDuration:0.5];
           SKScene * myScene3 = [[MyScene3 alloc] initWithSize:self.size];
           [self.view presentScene:myScene3 transition: reveal];
           return;
       }
       else if (n !=self && [n.name isEqual:@"nextLevelLabel"] && gameLevel >=3)
       {
           //gameLevel = 3;
           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"End of the Road" message:@"You reached the end of the game. More levels coming soon!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
       }
        else
        {
            return;
        }
    }
}

@end
