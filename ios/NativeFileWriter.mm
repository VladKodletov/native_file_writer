#import "NativeFileWriter.h"
#include "FileWriter.hpp"

@implementation NativeFileWriter

- (BOOL)writeToFileWithContent:(NSString *)content {
    std::string cppString = [content UTF8String];
    return FileWriter::writeToFile(cppString);
}

- (NSString *)readFromFile {
    std::string content = FileWriter::readFromFile();
    return [NSString stringWithUTF8String:content.c_str()];
}

@end