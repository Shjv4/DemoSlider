//
//  ViewController.m
//  DemoSlider
//
//  Created by hoangna on 4/2/13.
//  Copyright (c) 2013 HoangNA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
float oldValue;
int valueForSlider;
@synthesize myImageView, myLabel, mySlider;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// create label
    self.myLabel = [[UILabel alloc] init];
    self.myLabel.frame = CGRectMake(20, 80, 280, 40);
    self.myLabel.textAlignment = NSTextAlignmentCenter;
    self.myLabel.backgroundColor = [UIColor clearColor];
    self.myLabel.text = @"alpha";
    [self.view addSubview:self.myLabel];
    
    // create slider
    self.mySlider = [[UISlider alloc] init];
    self.mySlider.frame = CGRectMake(40, 30, 240, 25);
    [mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [mySlider setBackgroundColor:[UIColor clearColor]];
    self.mySlider.minimumValue = 0.0;
    self.mySlider.maximumValue = 1.0;
    self.mySlider.continuous = YES;
    self.mySlider.value = 0.2; // default value
    [self.view addSubview:self.mySlider];
    
    // create imageView
    self.myImageView = [[UIImageView alloc] init];
    self.myImageView.frame = CGRectMake(40, 140, 240, 240);
    self.myImageView.image = [UIImage imageNamed:@"Bane256.ico"];
    //self.myImageView.alpha = 0.0;
    [self.view addSubview:self.myImageView];
    
    // set every value of label, imageView by current value of slider
    self.myLabel.text = [NSString stringWithFormat:@"%0.2f", self.mySlider.value];
    self.myImageView.alpha = self.mySlider.value;
    oldValue = self.mySlider.value;
}
-(IBAction)sliderValueChanged:(UISlider *)sender
{
    
    if (sender.value < oldValue) {
        valueForSlider = -1;
    } else {
        valueForSlider = 1;
    }
    oldValue = sender.value;
    self.myImageView.alpha = sender.value;
    self.myLabel.text = [NSString stringWithFormat:@"%0.2f", sender.value];
    self.myLabel.frame = CGRectMake(myLabel.frame.origin.x + valueForSlider, myLabel.frame.origin.y, myLabel.frame.size.width, myLabel.frame.size.height);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
