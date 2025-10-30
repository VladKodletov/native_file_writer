#ifndef FileWriter_hpp
#define FileWriter_hpp

#include <string>

class FileWriter {
public:
    static bool writeToFile(const std::string& content);
    static std::string readFromFile();
private:
    static const std::string kFilePath;
};

#endif /* FileWriter_hpp */