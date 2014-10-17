//
//  Divvy.m
//  CodeChallenge3
//
//  Created by Vi on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "Divvy.h"

@implementation Divvy

- (instancetype)initWithJSONDictionary:(NSDictionary *)divvyDictionary {

    CLLocationCoordinate2D coord;
    coord.latitude = [[divvyDictionary objectForKey:@"latitude"] doubleValue];
    coord.longitude = [[divvyDictionary objectForKey:@"longitude"] doubleValue];

    self.coordinate = coord;

    self.title = [divvyDictionary objectForKey:@"stAddress1"];
    self.subtitle = [divvyDictionary objectForKey:@"availableDocks"];


    return self;
}

@end
