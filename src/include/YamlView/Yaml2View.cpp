#include <Yaml2View.h>

YV::Yaml2View::Yaml2View(){

}

void YV::Yaml2View::ReadYamlFile(std::string &ymlpath){
    m_ifile = new std::ifstream;
    m_ymlcontent = new std::string;

    struct stat buffer;
    if (stat (ymlpath.c_str(), &buffer) == 0){
        m_ifile->open(ymlpath);
        std::string content(
            (std::istreambuf_iterator<char>(*m_ifile)),
            (std::istreambuf_iterator<char>())
        );
        *m_ymlcontent = content;
    }

    delete m_ifile;
    delete m_ymlcontent;
}

void YV::Yaml2View::ShowYamlContent(){

}