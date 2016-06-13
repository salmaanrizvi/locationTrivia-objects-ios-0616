//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *) allLocationNames {
    
    NSMutableArray *locationNames = [[NSMutableArray alloc] init];
    
    for (FISLocation *location in self.locations) {
        [locationNames addObject:location.name];
    }
    return [[NSArray alloc] initWithArray:locationNames];
}

-(FISLocation *) locationNamed:(NSString *)name {
    
    for (FISLocation *location in self.locations) {
        if ([location.name isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

-(NSArray *) locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    
    NSMutableArray *locationsNearLatitude = [[NSMutableArray alloc] init];
    
    for (FISLocation *location in self.locations) {
        if ((latitude + margin >= location.latitude && latitude - margin <= location.latitude) && ((longitude + margin >= location.longitude && longitude - margin <= location.longitude))) {
            [locationsNearLatitude addObject:location];
        }
    }
    return [[NSArray alloc] initWithArray:locationsNearLatitude];
}

@end
