# @summary Configures Visual Studio Code
#
# Ensures user configuration directories exist, and that user settings
# and user keybinding files exist.
#
# @example
#   include vscode::config
class vscode::config {
  $vscode_user_code_directory = "${facts['windows_env']['APPDATA']}\\Code"
  $vscode_user_config_directory = "${vscode_user_code_directory}\\User"
  $vscode_user_settings_file_path = "${vscode_user_config_directory}\\settings.json"
  $vscode_user_keybinds_file_path = "${vscode_user_config_directory}\\keybindings.json"

  file { [$vscode_user_code_directory, $vscode_user_config_directory]:
    ensure => 'directory',
  }

  file { $vscode_user_settings_file_path:
    ensure  => 'file',
    require => File[$vscode_user_config_directory],
  }

  file { $vscode_user_keybinds_file_path:
    ensure  => 'file',
    require => File[$vscode_user_config_directory],
  }
}
