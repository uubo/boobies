//
//  FullScreenViewController.m
//  Boobies
//
//  Created by Влад Агиевич on 20.03.14.
//  Copyright (c) 2014 uubo. All rights reserved.
//

#import "FullScreenViewController.h"

@interface FullScreenViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FullScreenViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.imageView.image = [UIImage imageNamed:self.imageToShowName];
}

@end
