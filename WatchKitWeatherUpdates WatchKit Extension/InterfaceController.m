//
//  InterfaceController.m
//  WatchKitWeatherUpdates WatchKit Extension
//
//  Created by Albert Saucedo on 8/12/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@end


@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)onUpdateWeather {

    NSURL *url = [NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=Chicagi,il"];
    NSURLRequest *requestForWeatherData = [NSURLRequest requestWithURL:url];

    NSURLResponse *response = nil;
    NSError *error = nil;

    NSData *data = [NSURLConnection sendSynchronousRequest:requestForWeatherData
                                         returningResponse:&response
                                                     error:&error];
    NSMutableDictionary *allData = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:NSJSONReadingMutableContainers
                                                                     error:&error];

    NSString *currentWeather = nil;
    NSArray *weather = allData[@"weather"];

    for (NSDictionary *weatherDictionary in weather) {
        currentWeather = weatherDictionary[@"main"];
    }

    [self setImageAndTextWithWeather:currentWeather];
}

-(void)setImageAndTextWithWeather:(NSString *)weatherName{
    //Delete potential spaces in JSON array
    NSString *weatherNameWithoutSpaces = [weatherName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [_imgWeather setImageNamed:[weatherNameWithoutSpaces stringByAppendingString:@".jpg"]];

    //Making text more readable by creating a custom string
    NSMutableAttributedString *customString = [[NSMutableAttributedString alloc] initWithString:weatherNameWithoutSpaces];
    [customString addAttribute:NSFontAttributeName
                         value:[UIFont systemFontOfSize:18]
                         range:NSMakeRange(0, [weatherNameWithoutSpaces length])];

    [_lblWeatherType setAttributedText:customString];
}
@end



