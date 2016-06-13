//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Salmaan Rizvi on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype) init {
    return [self initWithName:@"" latitude:0.0 longitude:0.0];
}

-(instancetype) initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
   
    if (length >= self.name.length) {
        return self.name;
    }
    else {
        return [self.name substringToIndex:length];
    }
}

-(BOOL)hasValidData {
    
    if (self.latitude >= 90.0 || self.latitude <= -90.0) {
        return NO;
    }
    else if (self.longitude > 180.0 || self.longitude <= -180.0) {
        return NO;
    }
    else if (self.name == nil || [self.name isEqualToString:@""]) {
        return NO;
    }
    else {
        return YES;
    }
}

-(FISTrivium *)triviumWithMostLikes {
    if (self.trivia.count == 0) {
        return nil;
    }
    else {
        NSSortDescriptor *likeSorter = [[NSSortDescriptor alloc] initWithKey:@"likes" ascending:NO];
        [self.trivia sortUsingDescriptors:@[likeSorter]];
        return self.trivia[0];
    }
}

@end
