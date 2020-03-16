#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    NSMutableArray *happyArray = [NSMutableArray new];
    
    for (NSInteger i = sadArray.count - 1; i >= 0; i--) {
        NSNumber *currentNumber = sadArray[i];
        
        if (i == 0 || i + 1 == sadArray.count) {
            [happyArray addObject:currentNumber];
            continue;
        }
        
        NSNumber *previousNumber = sadArray[i - 1];
        NSNumber *nextNumber = happyArray.lastObject;
        
        int sumOfNearestElements = previousNumber.intValue + nextNumber.intValue;
        if (currentNumber.intValue <= sumOfNearestElements) {
            [happyArray addObject:currentNumber];
        }
    }
    
    return [[[happyArray reverseObjectEnumerator] allObjects] copy];
}

@end
