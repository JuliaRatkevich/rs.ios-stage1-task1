#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *billToSplit = [NSMutableArray arrayWithArray:bill];
    [billToSplit removeObjectAtIndex:index];
    
    NSNumber *totalSum = [billToSplit valueForKeyPath: @"@sum.self"];
    
    NSInteger difference = sum.integerValue - totalSum.integerValue / 2;
    if (difference == 0) {
        return @"Bon Appetit";
    } else {
        return [@(difference) stringValue];
    }
}

@end
