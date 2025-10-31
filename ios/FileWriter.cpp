#include "FileWriter.hpp"
#include <fstream>
#include <sstream>
#include <iostream>

const std::string FileWriter::kFilePath = []() -> std::string {
    const char* homeDir = getenv("HOME");
    if (homeDir != nullptr) {
        return std::string(homeDir) + "/Documents/flutter_native_counter.txt";
    }
    return "flutter_native_counter.txt";
}();

bool FileWriter::writeToFile(const std::string& content) {
    std::ofstream file(kFilePath); 
    if (!file.is_open()) {
        std::cerr << "Failed to open file: " << kFilePath << std::endl;
        return false;
    }
    file << content; 
    file.close();
    return true;
}

std::string FileWriter::readFromFile() {
    std::ifstream file(kFilePath);
    if (!file.is_open()) {
        return "File is empty";
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}