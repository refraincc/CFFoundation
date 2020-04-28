//
//  CFViewController.m
//  CFFoundation
//
//  Created by refraincc on 03/26/2019.
//  Copyright (c) 2019 refraincc. All rights reserved.
//

#import "CFViewController.h"
#import "CFPerson.h"
#import "CFFruits.h"

#import <CFFoundation/NSArray+CFCategory.h>




@interface CFViewController ()

@end

@implementation CFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

        
    CFPerson *p1 = [[CFPerson alloc] init];
    p1.name = @"111";
    
    CFPerson *p2 = [[CFPerson alloc] init];
    p2.name = @"111";
    
    CFPerson *p3 = [[CFPerson alloc] init];
    p3.name = @"dsfs";
    
    CFFruits *f = [[CFFruits alloc] init];
    
    
//    NSArray *ps = @[@"111", @"222", @"222"];
    NSArray *ps = @[p1, p1, p3];
    
//    NSArray *newPs = [ps valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
    NSArray *newPs = [ps cc_removeRepetitionObjectsWithKey:@"name"];
    
    NSLog(@"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
