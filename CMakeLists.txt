cmake_minimum_required(VERSION 3.14)

project(cry VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)


set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#find_package(Qt6 REQUIRED COMPONENTS Widgets)
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Widgets FileDialog Core Quick)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets Core Quick )


set(PROJECT_SOURCES
        choosefile.cpp
        choosefile.h
        main.cpp
        qml.qrc
        resource.qrc

)




if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(cry
        MANUAL_FINALIZATION
        ${PROJECT_SOURCES}
    )

target_link_libraries(cry
    PRIVATE Qt6::Widgets)
# Define target properties for Android with Qt 6 as:
#    set_property(TARGET cry APPEND PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR
#                 ${CMAKE_CURRENT_SOURCE_DIR}/android)
# For more information, see https://doc.qt.io/qt-6/qt-add-executable.html#target-creation
else()
    if(ANDROID)
        add_library(cry SHARED
            ${PROJECT_SOURCES}
        )
# Define properties for Android with Qt 5 after find_package() calls as:
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
    else()
        add_executable(cry
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(cry
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(cry
    PRIVATE Qt6::Widgets)
target_link_libraries(cry
  PRIVATE Qt6::Widgets Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)



set_target_properties(cry PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_import_qml_plugins(cry)
    qt_finalize_executable(cry)

set(CMAKE_AUTOMOC ON)
qt_add_qml_module(
    choosefile
    URI choosefile
    VERSION 1.0
    PLUGIN_TARGET choosefile
#    QML_FILES
#        VideoFile.qml
#        main.qml
#        ButtonComp.qml
#        SliderComp.qml
#        VideoAudio.qml
#        VideoControls.qml
#        VideoSlider.qml
    QML_FILES
        VideoFile.qml
    SOURCES
        choosefile.h choosefile.cpp
)

endif()
