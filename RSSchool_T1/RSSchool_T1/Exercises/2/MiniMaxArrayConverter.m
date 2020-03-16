#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSNumber *sum = [array valueForKeyPath: @"@sum.self"];
    NSNumber *min = [array valueForKeyPath: @"@min.self"];
    NSNumber *max = [array valueForKeyPath: @"@max.self"];
    
    NSNumber *minSum = @(sum.integerValue - max.integerValue);
    NSNumber *maxSum = @(sum.integerValue - min.integerValue);
    
    return @[minSum, maxSum];
}

@end
