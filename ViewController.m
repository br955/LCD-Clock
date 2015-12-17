//
//  ViewController.m
//  LCD Clock
//
//  Created by Aditya Narayan on 12/8/15.
//  Copyright (c) 2015 TURN TO TECH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dateFormat = [[NSDateFormatter alloc]init];
    // create custom colors //
    self.clockRed = [UIColor colorWithRed:173/255.0f green:34/255.0f blue:35/255.0f alpha:1];
    self.clockBlue = [UIColor colorWithRed:0/255.0f green:48/255.0f blue:224/255.0f alpha:1];
    self.currentZone = [NSTimeZone localTimeZone];
    self.defaults = [NSUserDefaults standardUserDefaults];
    
    // Uses User Defaults to choose time format //
    if ([[self.defaults objectForKey:@"Time Format"]  isEqual: @"12 hour"]) {
        [self.dateFormat setDateFormat:@"hh:mm aaa"];
    }
    else if ([[self.defaults objectForKey:@"Time Format"]  isEqual: @"24 hour"]){
        [self.dateFormat setDateFormat:@"HH:mm aaa"];
        self.ampmLabel.hidden = YES;
    }
    else{
        [self.dateFormat setDateFormat:@"hh:mm aaa"];
    }
    
    // User defaults to set Clock Color //
    if ([[self.defaults objectForKey:@"Clock Color"] isEqual: @"Red"]) {
        self.oneBot.backgroundColor = self.clockRed;
        self.oneBotleft.backgroundColor = self.clockRed;
        self.oneBotright.backgroundColor = self.clockRed;
        self.oneMid.backgroundColor = self.clockRed;
        self.oneTop.backgroundColor = self.clockRed;
        self.oneTopright.backgroundColor = self.clockRed;
        self.onTopleft.backgroundColor = self.clockRed;
        
        self.twoBot.backgroundColor = self.clockRed;
        self.twoBotleft.backgroundColor = self.clockRed;
        self.twoBotright.backgroundColor = self.clockRed;
        self.twoMid.backgroundColor = self.clockRed;
        self.twoTop.backgroundColor = self.clockRed;
        self.twoTopright.backgroundColor = self.clockRed;
        self.twoTopleft.backgroundColor = self.clockRed;
        
        self.threeBot.backgroundColor = self.clockRed;
        self.threeBotleft.backgroundColor = self.clockRed;
        self.threeBotright.backgroundColor = self.clockRed;
        self.threeMid.backgroundColor = self.clockRed;
        self.threeTop.backgroundColor = self.clockRed;
        self.threeTopright.backgroundColor = self.clockRed;
        self.threeTopleft.backgroundColor = self.clockRed;
        
        self.fourBot.backgroundColor = self.clockRed;
        self.fourBotL.backgroundColor = self.clockRed;
        self.fourBotR.backgroundColor = self.clockRed;
        self.fourMid.backgroundColor = self.clockRed;
        self.fourTop.backgroundColor = self.clockRed;
        self.fourTopL.backgroundColor = self.clockRed;
        self.fourTopR.backgroundColor = self.clockRed;
        
        self.colonA.backgroundColor = self.clockRed;
        self.colonB.backgroundColor = self.clockRed;
        self.ampmLabel.textColor = self.clockRed;
    } else {
        self.oneBot.backgroundColor = self.clockBlue;
        self.oneBotleft.backgroundColor = self.clockBlue;
        self.oneBotright.backgroundColor = self.clockBlue;
        self.oneMid.backgroundColor = self.clockBlue;
        self.oneTop.backgroundColor = self.clockBlue;
        self.oneTopright.backgroundColor = self.clockBlue;
        self.onTopleft.backgroundColor = self.clockBlue;
        
        self.twoBot.backgroundColor = self.clockBlue;
        self.twoBotleft.backgroundColor = self.clockBlue;
        self.twoBotright.backgroundColor = self.clockBlue;
        self.twoMid.backgroundColor = self.clockBlue;
        self.twoTop.backgroundColor = self.clockBlue;
        self.twoTopright.backgroundColor = self.clockBlue;
        self.twoTopleft.backgroundColor = self.clockBlue;
        
        self.threeBot.backgroundColor = self.clockBlue;
        self.threeBotleft.backgroundColor = self.clockBlue;
        self.threeBotright.backgroundColor = self.clockBlue;
        self.threeMid.backgroundColor = self.clockBlue;
        self.threeTop.backgroundColor = self.clockBlue;
        self.threeTopright.backgroundColor = self.clockBlue;
        self.threeTopleft.backgroundColor = self.clockBlue;
        
        self.fourBot.backgroundColor = self.clockBlue;
        self.fourBotL.backgroundColor = self.clockBlue;
        self.fourBotR.backgroundColor = self.clockBlue;
        self.fourMid.backgroundColor = self.clockBlue;
        self.fourTop.backgroundColor = self.clockBlue;
        self.fourTopL.backgroundColor = self.clockBlue;
        self.fourTopR.backgroundColor = self.clockBlue;
        
        self.colonA.backgroundColor = self.clockBlue;
        self.colonB.backgroundColor = self.clockBlue;
        self.ampmLabel.textColor = self.clockBlue;
    }
    
    if ([[self.defaults objectForKey:@"Background Color"] isEqual: @"White Background"]) {
        self.hourOnesPlaceView.backgroundColor = [UIColor whiteColor];
        self.hourTensPlaceView.backgroundColor = [UIColor whiteColor];
        self.minutesOnesPlaceView.backgroundColor = [UIColor whiteColor];
        self.minutesTensPlaceView.backgroundColor = [UIColor whiteColor];
        self.bigView.backgroundColor = [UIColor whiteColor];
        self.clockFace.backgroundColor = [UIColor whiteColor];
        self.colonView.backgroundColor = [UIColor whiteColor];
    } else {
        self.hourOnesPlaceView.backgroundColor = [UIColor blackColor];
        self.hourTensPlaceView.backgroundColor = [UIColor blackColor];
        self.minutesOnesPlaceView.backgroundColor = [UIColor blackColor];
        self.minutesTensPlaceView.backgroundColor = [UIColor blackColor];
        self.bigView.backgroundColor = [UIColor blackColor];
        self.clockFace.backgroundColor = [UIColor blackColor];
        self.colonView.backgroundColor = [UIColor blackColor];
    }
    
    // sets timer to update time every second //
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    }

-(void) updateTime{
    ///// create string to represent time. and substrings for each digit
    [self.dateFormat setTimeZone:self.currentZone];
    self.currentTime = [self.dateFormat stringFromDate: [NSDate date]];
    NSString *timeDigitOne = [self.currentTime substringWithRange: NSMakeRange(0, 1)];
    NSString *timeDigitTwo = [self.currentTime substringWithRange: NSMakeRange(1, 1)];
    NSString *timeDigitThree = [self.currentTime substringWithRange: NSMakeRange(3, 1)];
    NSString *timeDigitFour = [self.currentTime substringWithRange: NSMakeRange(4, 1)];
    ///// am or pm?
    NSString *ampm = [self.currentTime substringWithRange:NSMakeRange(6, 2)];
    
    //// now for each digit I make view hidden or not
    //// digit one
    if ([timeDigitOne isEqualToString:@"1"]) {
        self.oneBot.hidden = YES;
        self.oneBotleft.hidden = YES;
        self.oneBotright.hidden = NO;
        self.oneMid.hidden = YES;
        self.oneTop.hidden = YES;
        self.oneTopright.hidden = NO;
        self.onTopleft.hidden = YES;
    }
    else if ([timeDigitOne isEqualToString:@"2"]){
        self.oneBot.hidden = NO;
        self.oneBotleft.hidden = NO;
        self.oneBotright.hidden = YES;
        self.oneMid.hidden = NO;
        self.oneTop.hidden = NO;
        self.oneTopright.hidden = NO;
        self.onTopleft.hidden = YES;
    }
    else if ([timeDigitOne isEqualToString:@"0"]){
        self.oneBot.hidden = YES;
        self.oneBotleft.hidden = YES;
        self.oneBotright.hidden = YES;
        self.oneMid.hidden = YES;
        self.oneTop.hidden = YES;
        self.oneTopright.hidden = YES;
        self.onTopleft.hidden = YES;
    }
    
    // Digit Two
    if ([timeDigitTwo isEqualToString:@"1"]){
        self.twoBot.hidden = YES;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = YES;
        self.twoTop.hidden = YES;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = YES;
    }
    else if ([timeDigitTwo isEqualToString:@"2"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = NO;
        self.twoBotright.hidden = YES;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = YES;
    }
    else if ([timeDigitTwo isEqualToString:@"3"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = YES;
    }
    else if ([timeDigitTwo isEqualToString:@"4"]){
        self.twoBot.hidden = YES;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = YES;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = NO;
    }
    else if ([timeDigitTwo isEqualToString:@"5"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = YES;
        self.twoTopleft.hidden = NO;
    }
    else if ([timeDigitTwo isEqualToString:@"6"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = NO;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = YES;
        self.twoTopleft.hidden = NO;
    }
    else if ([timeDigitTwo isEqualToString:@"7"]){
        self.twoBot.hidden = YES;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = YES;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = YES;
    }
    else if ([timeDigitTwo isEqualToString:@"8"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = NO;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = NO;
    }
    else if ([timeDigitTwo isEqualToString:@"9"]){
        self.twoBot.hidden = YES;
        self.twoBotleft.hidden = YES;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = NO;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = NO;
    }
    else if ([timeDigitTwo isEqualToString:@"0"]){
        self.twoBot.hidden = NO;
        self.twoBotleft.hidden = NO;
        self.twoBotright.hidden = NO;
        self.twoMid.hidden = YES;
        self.twoTop.hidden = NO;
        self.twoTopright.hidden = NO;
        self.twoTopleft.hidden = NO;
    }
    // Digit Three
    if ([timeDigitThree isEqualToString:@"1"]){
        self.threeBot.hidden = YES;
        self.threeBotleft.hidden = YES;
        self.threeBotright.hidden = NO;
        self.threeMid.hidden = YES;
        self.threeTop.hidden = YES;
        self.threeTopright.hidden = NO;
        self.threeTopleft.hidden = YES;
    }
    else if ([timeDigitThree isEqualToString:@"2"]){
        self.threeBot.hidden = NO;
        self.threeBotleft.hidden = NO;
        self.threeBotright.hidden = YES;
        self.threeMid.hidden = NO;
        self.threeTop.hidden = NO;
        self.threeTopright.hidden = NO;
        self.threeTopleft.hidden = YES;
    }
    else if ([timeDigitThree isEqualToString:@"3"]){
        self.threeBot.hidden = NO;
        self.threeBotleft.hidden = YES;
        self.threeBotright.hidden = NO;
        self.threeMid.hidden = NO;
        self.threeTop.hidden = NO;
        self.threeTopright.hidden = NO;
        self.threeTopleft.hidden = YES;
    }
    else if ([timeDigitThree isEqualToString:@"4"]){
        self.threeBot.hidden = YES;
        self.threeBotleft.hidden = YES;
        self.threeBotright.hidden = NO;
        self.threeMid.hidden = NO;
        self.threeTop.hidden = YES;
        self.threeTopright.hidden = NO;
        self.threeTopleft.hidden = NO;
    }
    else if ([timeDigitThree isEqualToString:@"5"]){
        self.threeBot.hidden = NO;
        self.threeBotleft.hidden = YES;
        self.threeBotright.hidden = NO;
        self.threeMid.hidden = NO;
        self.threeTop.hidden = NO;
        self.threeTopright.hidden = YES;
        self.threeTopleft.hidden = NO;
    }
    else if ([timeDigitThree isEqualToString:@"0"]){
        self.threeBot.hidden = NO;
        self.threeBotleft.hidden = NO;
        self.threeBotright.hidden = NO;
        self.threeMid.hidden = YES;
        self.threeTop.hidden = NO;
        self.threeTopright.hidden = NO;
        self.threeTopleft.hidden = NO;
    }
    // Digit Four
    if ([timeDigitFour isEqualToString:@"1"]){
        self.fourBot.hidden = YES;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = YES;
        self.fourTop.hidden = YES;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = YES;
    }
    else if ([timeDigitFour isEqualToString:@"2"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = NO;
        self.fourBotR.hidden = YES;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = YES;
    }
    else if ([timeDigitFour isEqualToString:@"3"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = YES;
    }
    else if ([timeDigitFour isEqualToString:@"4"]){
        self.fourBot.hidden = YES;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = YES;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = NO;
    }
    else if ([timeDigitFour isEqualToString:@"5"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = YES;
        self.fourTopL.hidden = NO;
    }
    else if ([timeDigitFour isEqualToString:@"6"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = NO;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = YES;
        self.fourTopL.hidden = NO;
    }
    else if ([timeDigitFour isEqualToString:@"7"]){
        self.fourBot.hidden = YES;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = YES;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = YES;
    }
    else if ([timeDigitFour isEqualToString:@"8"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = NO;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = NO;
    }
    else if ([timeDigitFour isEqualToString:@"9"]){
        self.fourBot.hidden = YES;
        self.fourBotL.hidden = YES;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = NO;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = NO;
    }
    else if ([timeDigitFour isEqualToString:@"0"]){
        self.fourBot.hidden = NO;
        self.fourBotL.hidden = NO;
        self.fourBotR.hidden = NO;
        self.fourMid.hidden = YES;
        self.fourTop.hidden = NO;
        self.fourTopR.hidden = NO;
        self.fourTopL.hidden = NO;
    }
    if ([ampm isEqualToString:@"am"]) {
        self.ampmLabel.text = @"am";
    }
    else{
        self.ampmLabel.text = @"pm";
    }


}

// button that switches between 12 and 24 hour format //
- (IBAction)timeFormat:(id)sender {
    if ([self.dateFormat.dateFormat isEqual: @"HH:mm aaa"]) {
        [self.dateFormat setDateFormat:@"hh:mm aaa"];
        self.ampmLabel.hidden = NO;
        [self.defaults setObject:@"12 hour" forKey:@"Time Format"]; // sets default to 12 hour
    }
    else if ([self.dateFormat.dateFormat isEqual:@"hh:mm aaa"]){
        [self.dateFormat setDateFormat:@"HH:mm aaa"];
        self.ampmLabel.hidden = YES;
        [self.defaults setObject:@"24 hour" forKey:@"Time Format"]; // sets default to 24 hour        
    }
    
}

- (IBAction)changeBackgroundColor:(id)sender {
    if (self.hourTensPlaceView.backgroundColor == [UIColor blackColor]){
        self.hourOnesPlaceView.backgroundColor = [UIColor whiteColor];
        self.hourTensPlaceView.backgroundColor = [UIColor whiteColor];
        self.minutesOnesPlaceView.backgroundColor = [UIColor whiteColor];
        self.minutesTensPlaceView.backgroundColor = [UIColor whiteColor];
        self.bigView.backgroundColor = [UIColor whiteColor];
        self.clockFace.backgroundColor = [UIColor whiteColor];
        self.colonView.backgroundColor = [UIColor whiteColor];
        [self.defaults setObject:@"White Background" forKey:@"Background Color"];
    }
    else{
        self.hourOnesPlaceView.backgroundColor = [UIColor blackColor];
        self.hourTensPlaceView.backgroundColor = [UIColor blackColor];
        self.minutesOnesPlaceView.backgroundColor = [UIColor blackColor];
        self.minutesTensPlaceView.backgroundColor = [UIColor blackColor];
        self.bigView.backgroundColor = [UIColor blackColor];
        self.clockFace.backgroundColor = [UIColor blackColor];
        self.colonView.backgroundColor = [UIColor blackColor];
        [self.defaults setObject:@"Black Background" forKey:@"Background Color"];
    }
}

- (IBAction)changeClockColor:(id)sender {
    if ([self.oneBotright.backgroundColor isEqual:self.clockRed]) {
        self.oneBot.backgroundColor = self.clockBlue;
        self.oneBotleft.backgroundColor = self.clockBlue;
        self.oneBotright.backgroundColor = self.clockBlue;
        self.oneMid.backgroundColor = self.clockBlue;
        self.oneTop.backgroundColor = self.clockBlue;
        self.oneTopright.backgroundColor = self.clockBlue;
        self.onTopleft.backgroundColor = self.clockBlue;
        
        self.twoBot.backgroundColor = self.clockBlue;
        self.twoBotleft.backgroundColor = self.clockBlue;
        self.twoBotright.backgroundColor = self.clockBlue;
        self.twoMid.backgroundColor = self.clockBlue;
        self.twoTop.backgroundColor = self.clockBlue;
        self.twoTopright.backgroundColor = self.clockBlue;
        self.twoTopleft.backgroundColor = self.clockBlue;
        
        self.threeBot.backgroundColor = self.clockBlue;
        self.threeBotleft.backgroundColor = self.clockBlue;
        self.threeBotright.backgroundColor = self.clockBlue;
        self.threeMid.backgroundColor = self.clockBlue;
        self.threeTop.backgroundColor = self.clockBlue;
        self.threeTopright.backgroundColor = self.clockBlue;
        self.threeTopleft.backgroundColor = self.clockBlue;
        
        self.fourBot.backgroundColor = self.clockBlue;
        self.fourBotL.backgroundColor = self.clockBlue;
        self.fourBotR.backgroundColor = self.clockBlue;
        self.fourMid.backgroundColor = self.clockBlue;
        self.fourTop.backgroundColor = self.clockBlue;
        self.fourTopL.backgroundColor = self.clockBlue;
        self.fourTopR.backgroundColor = self.clockBlue;
        
        self.colonA.backgroundColor = self.clockBlue;
        self.colonB.backgroundColor = self.clockBlue;
        self.ampmLabel.textColor = self.clockBlue;
        [self.defaults setObject:@"Blue" forKey:@"Clock Color"];
    }
    else{
        self.oneBot.backgroundColor = self.clockRed;
        self.oneBotleft.backgroundColor = self.clockRed;
        self.oneBotright.backgroundColor = self.clockRed;
        self.oneMid.backgroundColor = self.clockRed;
        self.oneTop.backgroundColor = self.clockRed;
        self.oneTopright.backgroundColor = self.clockRed;
        self.onTopleft.backgroundColor = self.clockRed;
        
        self.twoBot.backgroundColor = self.clockRed;
        self.twoBotleft.backgroundColor = self.clockRed;
        self.twoBotright.backgroundColor = self.clockRed;
        self.twoMid.backgroundColor = self.clockRed;
        self.twoTop.backgroundColor = self.clockRed;
        self.twoTopright.backgroundColor = self.clockRed;
        self.twoTopleft.backgroundColor = self.clockRed;
        
        self.threeBot.backgroundColor = self.clockRed;
        self.threeBotleft.backgroundColor = self.clockRed;
        self.threeBotright.backgroundColor = self.clockRed;
        self.threeMid.backgroundColor = self.clockRed;
        self.threeTop.backgroundColor = self.clockRed;
        self.threeTopright.backgroundColor = self.clockRed;
        self.threeTopleft.backgroundColor = self.clockRed;
        
        self.fourBot.backgroundColor = self.clockRed;
        self.fourBotL.backgroundColor = self.clockRed;
        self.fourBotR.backgroundColor = self.clockRed;
        self.fourMid.backgroundColor = self.clockRed;
        self.fourTop.backgroundColor = self.clockRed;
        self.fourTopL.backgroundColor = self.clockRed;
        self.fourTopR.backgroundColor = self.clockRed;
        
        self.colonA.backgroundColor = self.clockRed;
        self.colonB.backgroundColor = self.clockRed;
        self.ampmLabel.textColor = self.clockRed;
        [self.defaults setObject:@"Red" forKey:@"Clock Color"];
    }
   
        
    
    
}

- (IBAction)changeTimeZone:(id)sender {
    if (self.currentZone == [NSTimeZone localTimeZone]) { //local vs pst won't work on west coast
        self.currentZone = [NSTimeZone timeZoneWithAbbreviation:@"PST"];
    } else {
        self.currentZone = [NSTimeZone localTimeZone];
    }
}

// change in orientation callback
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"before rotation begins");
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        NSLog(@"during rotation");
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        NSLog(@"after rotation ends");
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
    }];
}





@end








        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

















