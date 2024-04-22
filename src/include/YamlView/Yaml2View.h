#ifndef _YAML2VIEW_
#define _YAML2VIEW_
#include <fstream>
#include <string>
#include <sys/stat.h>
#endif

namespace YV{
    class Yaml2View {
        public:
            Yaml2View();
            void ReadYamlFile(std::string &ymlpath);
            void ShowYamlContent();
        private:
            std::ifstream *m_ifile;
            std::string *m_ymlcontent;
    };
}
