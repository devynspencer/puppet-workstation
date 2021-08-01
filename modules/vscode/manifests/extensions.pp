# @summary Installs Visual Studio Code extensions
#
# Installs each extension in the $vscode_extensions array. Uses the Visual Studio Code
# executable to determine if an extension is installed, and if not installs it.
#
# @example
#   include vscode::extensions
class vscode::extensions {
  $vscode_extensions_directory = "${facts['windows_env']['USERPROFILE']}\\.vscode\\extensions"
  $vscode_extensions = [
    'ms-azuretools.vscode-docker',
    'ms-kubernetes-tools.vscode-kubernetes-tools',
    'ms-python.python',
    'ms-python.vscode-pylance',
    'ms-toolsai.jupyter',
    'ms-vscode-remote.remote-containers',
    'ms-vscode-remote.remote-ssh-edit',
    'ms-vscode-remote.remote-ssh',
    'ms-vscode-remote.remote-wsl',
    'ms-vscode.powershell',
    'puppet.puppet-vscode',
    'rebornix.ruby',
    'redhat.vscode-xml',
    'redhat.vscode-yaml',
  ]

  file { $vscode_extensions_directory:
    ensure => 'directory'
  }

  $vscode_extensions.each | $extension | {
    exec { "install_vscode_extension_name_${extension}":
      command  => "code --install-extension ${extension}",
      unless   => "if ((code --list-extensions) -notcontains '${extension}') { exit 1 }",
      provider => 'powershell',
      require  => Class['vscode::install']
    }
  }
}
