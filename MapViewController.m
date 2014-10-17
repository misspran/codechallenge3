//
//  MapViewController.m
//  CodeChallenge3
//
//  Created by Vik Denic on 10/16/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MapViewController.h"
#import "StationsListViewController.h"
#import "Divvy.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property CLLocationManager *locationManager;


@property NSArray *divvy;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];

    NSURL *url = [NSURL URLWithString:@"http://www.divvybikes.com/stations/json/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *tempDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSMutableArray *tempArray = [[tempDictionary objectForKey:@"stationBeanList"]mutableCopy];

        for (NSDictionary *anotherTempDictionary in tempArray)
        {
            Divvy *stuffs = [[Divvy alloc] initWithJSONDictionary:anotherTempDictionary];
            [self.mapView addAnnotation:stuffs];
            [self.mapView showAnnotations:self.mapView.annotations animated:YES];
            

        }

    }];



}

- (MKAnnotationView *)mapView: (MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if(annotation == mapView.userLocation)
    {
        return nil;
    }

    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier: @"MyPinID"];
    pin.enabled = YES;
    pin.canShowCallout = YES;
    pin.rightCalloutAccessoryView = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];

    return pin;
}


@end
