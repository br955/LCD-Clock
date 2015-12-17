//
//  ViewController.h
//  LCD Clock
//
//  Created by Aditya Narayan on 12/8/15.
//  Copyright (c) 2015 TURN TO TECH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(void) updateTime;
@property NSTimer *timer;
@property NSString *currentTime;
@property NSDateFormatter *dateFormat;
@property NSUserDefaults *defaults;
@property UIColor *clockRed;
@property UIColor *clockBlue;
@property NSTimeZone *currentZone;

///////
@property (weak, nonatomic) IBOutlet UIView *hourTensPlaceView;
@property (weak, nonatomic) IBOutlet UIView *hourOnesPlaceView;
@property (weak, nonatomic) IBOutlet UIView *minutesTensPlaceView;
@property (weak, nonatomic) IBOutlet UIView *minutesOnesPlaceView;
@property (strong, nonatomic) IBOutlet UIView *bigView;
@property (weak, nonatomic) IBOutlet UIView *clockFace;
@property (weak, nonatomic) IBOutlet UIView *colonView;
//////
@property (weak, nonatomic) IBOutlet UIView *oneBot;
@property (weak, nonatomic) IBOutlet UIView *oneBotleft;
@property (weak, nonatomic) IBOutlet UIView *oneBotright;
@property (weak, nonatomic) IBOutlet UIView *oneTopright;
@property (weak, nonatomic) IBOutlet UIView *onTopleft;
@property (weak, nonatomic) IBOutlet UIView *oneMid;
@property (weak, nonatomic) IBOutlet UIView *oneTop;
///////
@property (weak, nonatomic) IBOutlet UIView *twoBot;
@property (weak, nonatomic) IBOutlet UIView *twoBotleft;
@property (weak, nonatomic) IBOutlet UIView *twoBotright;
@property (weak, nonatomic) IBOutlet UIView *twoTopright;
@property (weak, nonatomic) IBOutlet UIView *twoTopleft;
@property (weak, nonatomic) IBOutlet UIView *twoMid;
@property (weak, nonatomic) IBOutlet UIView *twoTop;
///////
@property (weak, nonatomic) IBOutlet UIView *threeBot;
@property (weak, nonatomic) IBOutlet UIView *threeBotleft;
@property (weak, nonatomic) IBOutlet UIView *threeBotright;
@property (weak, nonatomic) IBOutlet UIView *threeTopright;
@property (weak, nonatomic) IBOutlet UIView *threeTopleft;
@property (weak, nonatomic) IBOutlet UIView *threeMid;
@property (weak, nonatomic) IBOutlet UIView *threeTop;
///////
@property (weak, nonatomic) IBOutlet UIView *fourBot;
@property (weak, nonatomic) IBOutlet UIView *fourBotL;
@property (weak, nonatomic) IBOutlet UIView *fourBotR;
@property (weak, nonatomic) IBOutlet UIView *fourTopR;
@property (weak, nonatomic) IBOutlet UIView *fourTopL;
@property (weak, nonatomic) IBOutlet UIView *fourMid;
@property (weak, nonatomic) IBOutlet UIView *fourTop;
///////
@property (weak, nonatomic) IBOutlet UIView *colonA;
@property (weak, nonatomic) IBOutlet UIView *colonB;
///////
@property (weak, nonatomic) IBOutlet UILabel *ampmLabel;
///////
- (IBAction)timeFormat:(id)sender;
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeClockColor:(id)sender;
- (IBAction)changeTimeZone:(id)sender;







@end

