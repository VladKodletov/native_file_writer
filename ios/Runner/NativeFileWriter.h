#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativeFileWriter : NSObject

- (BOOL)writeToFileWithContent:(NSString *)content;
- (NSString *)readFromFile;

@end

NS_ASSUME_NONNULL_END