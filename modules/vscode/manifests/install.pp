# @summary Installs Visual Studio Code.
#
# Downloads the Visual Studio Code system installer and then installs.
#
# @example
#   include vscode::install
class vscode::install {
  file { $vscode::download_file_path:
    ensure => 'file',
    source => $vscode::download_url
  }

  package { 'Microsoft Visual Studio Code':
    ensure          => 'installed',
    source          => $vscode::download_file_path,
    install_options => [
      '/verysilent',
      'mergetasks=!runCode,!desktopicon,!quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath',
    ],
    require         => File[$vscode::download_file_path],
  }

  windows_env { 'PATH=C:\\Program Files\\Microsoft VS Code\\bin': }
}
