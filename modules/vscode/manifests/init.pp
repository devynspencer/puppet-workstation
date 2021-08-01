# @summary Manage installation and configuration of Visual Studio Code.
#
# Installs and configures Microsoft Visual Studio Code. Optionally installs
# and configures extensions as well.
#
# @example
#   include vscode
class vscode (
  String $download_url,
  Stdlib::Absolutepath $download_file_path,
  Stdlib::Absolutepath $user_code_directory,
  Stdlib::Absolutepath $user_config_directory,
  Stdlib::Absolutepath $user_settings_file_path,
  Stdlib::Absolutepath $user_keybinds_file_path,
  Stdlib::Absolutepath $extensions_directory,
  Array[String] $extensions,
) {
  contain vscode::install
  contain vscode::config
  contain vscode::extensions

  Class['vscode::install'] -> Class['vscode::config'] ~> Class['vscode::extensions']
}
