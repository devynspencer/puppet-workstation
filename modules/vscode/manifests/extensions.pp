# @summary Installs Visual Studio Code extensions
#
# Installs each extension listed in $vscode::extensions. Uses the Visual Studio Code
# executable to determine if an extension is installed, and if not installs it.
#
# @example
#   include vscode::extensions
class vscode::extensions {
  file { $vscode::extensions_directory:
    ensure => 'directory'
  }

  $vscode::extensions.each | $extension | {
    exec { "vscode_extension_${extension}":
      command  => "code --install-extension ${extension}",
      unless   => "if ((code --list-extensions) -notcontains '${extension}') { exit 1 }",
      provider => 'powershell',
      require  => Class['vscode::install']
    }
  }
}
