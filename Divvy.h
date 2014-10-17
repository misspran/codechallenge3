//
//  Divvy.h
//  CodeChallenge3
//
//  Created by Vi on 10/17/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Divvy : MKPointAnnotation

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict;


@end
