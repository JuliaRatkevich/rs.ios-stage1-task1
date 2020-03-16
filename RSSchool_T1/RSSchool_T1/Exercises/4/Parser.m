#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSMutableArray<NSNumber *> *squareBrackets = [NSMutableArray<NSNumber *> new];
    NSMutableArray<NSNumber *> *angleBrackets = [NSMutableArray<NSNumber *> new];
    NSMutableArray<NSNumber *> *roundBrackets = [NSMutableArray<NSNumber *> new];
    
    NSMutableArray<NSValue *> *ranges = [NSMutableArray<NSValue *> new];
    
    for (NSInteger i = 0; i < string.length; i++) {
        unichar character = [string characterAtIndex:i];
        switch (character) {
            case '[':
                [squareBrackets addObject:@(i)];
                break;
            case ']': {
                NSNumber *openBracket = [squareBrackets lastObject];
                if (openBracket != nil) {
                    NSInteger length = i - openBracket.integerValue - 1;
                    NSRange range = NSMakeRange(openBracket.integerValue + 1, length);
                    [ranges addObject:[NSValue valueWithRange:range]];
                    [squareBrackets removeObject:openBracket];
                }
            }
                break;
            case '<':
                [angleBrackets addObject:@(i)];
                break;
            case '>': {
                NSNumber *openBracket = [angleBrackets lastObject];
                if (openBracket != nil) {
                    NSInteger length = i - openBracket.integerValue - 1;
                    NSRange range = NSMakeRange(openBracket.integerValue + 1, length);
                    [ranges addObject:[NSValue valueWithRange:range]];
                    [angleBrackets removeObject:openBracket];
                }
            }
                break;
            case '(':
                [roundBrackets addObject:@(i)];
                break;
            case ')': {
                NSNumber *openBracket = [roundBrackets lastObject];
                if (openBracket != nil) {
                    NSInteger length = i - openBracket.integerValue - 1;
                    NSRange range = NSMakeRange(openBracket.integerValue + 1, length);
                    [ranges addObject:[NSValue valueWithRange:range]];
                    [roundBrackets removeObject:openBracket];
                }
            }
                break;
            default:
                break;
        }
    }
    
    [ranges sortUsingComparator:^NSComparisonResult(NSValue *obj1, NSValue *obj2) {
        NSRange firstRange = [obj1 rangeValue];
        NSRange secondRange = [obj2 rangeValue];
        return firstRange.location < secondRange.location ? NSOrderedAscending : NSOrderedDescending;
    }];
    
    NSMutableArray<NSString *> *subStrings = [NSMutableArray new];
    for (NSValue *rangeValue in ranges) {
        NSRange range = [rangeValue rangeValue];
        NSString *subString = [string substringWithRange:range];
        [subStrings addObject:subString];
    }
    
    return [subStrings copy];
}

@end
