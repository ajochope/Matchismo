//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Ajo Chope on 20/08/13.
//  Copyright (c) 2013 ocallesObjective-C. All rights reserved.
//

#import "GameResultViewController.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultViewController

- (void) setup
{
    // initialization that can't wait until viewdidload
}

- (void) awakeFromNib
{
    [self setup];
}
 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}


@end
