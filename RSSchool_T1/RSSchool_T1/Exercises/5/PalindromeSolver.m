#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSInteger minChanges = 0;
    for (NSInteger i = 0; i < n.integerValue / 2; i++) {
        unichar beginnig = [s characterAtIndex:i];
        unichar end = [s characterAtIndex: n.integerValue - i - 1];
        if (beginnig != end) {
            minChanges++;
        }
    }
    
    if (minChanges > k.integerValue) {
        return @"-1";
    }
    
    NSInteger numberOfChanges = k.integerValue;
    NSInteger overflow = numberOfChanges - minChanges;
    NSMutableString *result = [[NSMutableString alloc] initWithString:s];
    for (NSInteger i = 0; i < n.integerValue / 2; i++) {
        unichar beginnig = [result characterAtIndex:i];
        unichar end = [result characterAtIndex: n.integerValue - i - 1];
        if (beginnig == end) {
            continue;
        }
        
        if (overflow > 0) {
            [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
            [result replaceCharactersInRange:NSMakeRange(result.length - i - 1, 1) withString:@"9"];
            //            numberOfChanges--;
            overflow--;
            continue;
        }
        
        if (beginnig > end) {
            NSString *replacement = [NSString stringWithCharacters:&beginnig length:1];
            [result replaceCharactersInRange:NSMakeRange(result.length - i - 1, 1) withString: replacement];
            numberOfChanges--;
        } else if (end > beginnig) {
            NSString *replacement = [NSString stringWithCharacters:&end length:1];
            [result replaceCharactersInRange:NSMakeRange(i, 1) withString: replacement];
            numberOfChanges--;
        }
    }
    
    NSInteger allowedNinePairs = (numberOfChanges - minChanges) / 2;
    
    for (NSInteger i = 0; i < allowedNinePairs; i++) {
        unichar beginnig = [result characterAtIndex:i];
        if (beginnig == '9') {
            continue;
        }
        
        [result replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
        [result replaceCharactersInRange:NSMakeRange(result.length - i - 1, 1) withString:@"9"];
    }
    
    
    
    return [result copy];
}

@end
