#include "include/vclibs/vclibs_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "vclibs_plugin.h"

void VclibsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  vclibs::VclibsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
