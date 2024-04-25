add_executable(${PROJECT_NAME} ${TEST_DIR}/src/main.cpp)

target_include_directories(
        ${PROJECT_NAME} PUBLIC
        .
        ${YMLCFG_LIB_DIR}
    )

target_link_libraries(${PROJECT_NAME} PUBLIC ${ylib})