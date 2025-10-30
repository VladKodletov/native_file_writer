#include "FileWriter.hpp"
#include <fstream>
#include <sstream>

const std::string FileWriter::kFilePath = "/tmp/flutter_native_counter.txt";

bool FileWriter::writeToFile(const std::string& content) {
    std::ofstream file(kFilePath);
    if (!file.is_open()) {
        return false;
    }
    file << content;
    return true;
}

std::string FileWriter::readFromFile() {
    std::ifstream file(kFilePath);
    if (!file.is_open()) {
        return "";
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}