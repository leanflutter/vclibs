cmake_minimum_required(VERSION 3.14)
set(PROJECT_NAME "vclibs")
project(${PROJECT_NAME} LANGUAGES CXX)

# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "vclibs_plugin")

# VCLibs
set(VC_LIBS_DIR "${CMAKE_CURRENT_SOURCE_DIR}/VCLibs")
set(VC_LIBS_MSVCP140 "${VC_LIBS_DIR}/msvcp140.dll")
set(VC_LIBS_VCRUNTIME140 "${VC_LIBS_DIR}/vcruntime140.dll")
set(VC_LIBS_VCRUNTIME140_1 "${VC_LIBS_DIR}/vcruntime140_1.dll")

add_library(${PLUGIN_NAME} SHARED
  "vclibs_plugin.cpp"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter flutter_wrapper_plugin)

# List of absolute paths to libraries that should be bundled with the plugin
set(vclibs_bundled_libraries
  ""
  ${VC_LIBS_MSVCP140}
  ${VC_LIBS_VCRUNTIME140}
  ${VC_LIBS_VCRUNTIME140_1}
  PARENT_SCOPE
)
