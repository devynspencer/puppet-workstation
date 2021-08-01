# frozen_string_literal: true

require 'spec_helper'
require 'facter'
require 'facter/vscode_extensions'

describe :vscode_extensions, type: :fact do
  subject(:fact) { Facter.fact(:vscode_extensions) }

  before :each do
    # perform any action that should be run before every test
    Facter.clear
  end

  it 'returns an array' do
    expect(fact.value).to be_an_instance_of(Array)
  end
end
