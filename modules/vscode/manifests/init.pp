# @summary Manage installation and configuration of Visual Studio Code.
#
# Installs and configures Microsoft Visual Studio Code. Optionally installs
# and configures extensions as well.
#
# @example
#   include vscode
class vscode {
  contain vscode::install
  contain vscode::config
  contain vscode::extensions

  Class['vscode::install'] -> Class['vscode::config'] ~> Class['vscode::extensions']
}
