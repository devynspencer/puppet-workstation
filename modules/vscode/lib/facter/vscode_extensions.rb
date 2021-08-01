# frozen_string_literal: true

Facter.add(:vscode_extensions) do
  # TODO: Fact can only run if Visual Studio Code is already installed
  # confine :vscode_installed

  setcode do
    extensions = []

    Facter::Core::Execution.execute('code --list-extensions --show-versions').split(/\n+/).each do |extension|
      name, version = extension.split('@', 2)
      extensions.push({ :name => name, :version => version })
    end

    extensions
  end
end
