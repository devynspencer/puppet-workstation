# @summary Configures Visual Studio Code
#
# Ensures user configuration directories exist, and that user settings
# and user keybinding files exist.
#
# @example
#   include vscode::config
class vscode::config {
  file { [$vscode::user_code_directory, $vscode::user_config_directory]:
    ensure => 'directory',
  }

  file { $vscode::user_settings_file_path:
    ensure  => 'file',
    source  => 'puppet:///modules/vscode/settings.json',
    require => File[$vscode::user_config_directory],
  }

  file { $vscode::user_keybinds_file_path:
    ensure  => 'file',
    source  => 'puppet:///modules/vscode/keybindings.json',
    require => File[$vscode::user_config_directory],
  }
}
