//
//  InterfaceController.h
//  WatchKitWeatherUpdates WatchKit Extension
//
//  Created by Albert Saucedo on 8/12/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *lblWeatherType;
@property (weak, nonatomic) IBOutlet WKInterfaceImage *imgWeather;

- (IBAction)onUpdateWeather;
@end
