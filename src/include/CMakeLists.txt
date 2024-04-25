set(YMLCFG_LIB_DIR ${LIBS_DIR}/YamlConfig)
set(ylib YMLCFG_LIBS)

add_library(${ylib} ${YMLCFG_LIB_DIR}/Yaml2View.cpp)