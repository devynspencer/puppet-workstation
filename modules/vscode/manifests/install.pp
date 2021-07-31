# @summary Installs Visual Studio Code.
#
# Downloads the Visual Studio Code system installer and then installs.
#
# @example
#   include vscode::install
class vscode::install {
  file { 'C:\\Windows\\temp\\VSCodeSetup-x64-1.58.2.exe':
    ensure => 'file',
    source => 'https://az764295.vo.msecnd.net/stable/c3f126316369cd610563c75b1b1725e0679adfb3/VSCodeSetup-x64-1.58.2.exe'
  }

  package { 'Microsoft Visual Studio Code':
    ensure          => 'installed',
    source          => 'C:\\Windows\\temp\\VSCodeSetup-x64-1.58.2.exe',
    install_options => [
      '/verysilent',
      'mergetasks=!runCode,!desktopicon,!quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath',
    ],
    require         => File['C:\\Windows\\temp\\VSCodeSetup-x64-1.58.2.exe'],
  }

  windows_env { 'PATH=C:\\Program Files\\Microsoft VS Code\\bin': }
}
