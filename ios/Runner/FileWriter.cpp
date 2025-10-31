#include "FileWriter.hpp"
#import <Foundation/Foundation.h>
#include <fstream>
#include <sstream>

const std::string FileWriter::kFileName = "hello.txt";

bool FileWriter::writeToFile(const std::string& content) {
    std::string filePath = getDocumentsPath() + "/" + kFileName;
    std::ofstream file(filePath);
    if (!file.is_open()) {
        return false;
    }
    file << content;
    file.close();
    return true;
}

std::string FileWriter::readFromFile() {
    std::string filePath = getDocumentsPath() + "/" + kFileName;
    std::ifstream file(filePath);
    if (!file.is_open()) {
        return "";
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    file.close();
    return buffer.str();
}

const std::string FileWriter::getDocumentsPath() {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return std::string([documentsDirectory UTF8String]);
}