# frozen_string_literal: true

require_relative '../method_file_controller'
require 'rspec'

describe 'Testing the file controller with the correct data' do
  let(:string) do
    <<-STRING
      123
      321
      456
    STRING
  end
  let(:id) { 2 }
  let(:pattern) { '21' }
  let(:text) { '789' }
  let(:name) { '789' }

  before { File.write(TASK_FILE, string) }

  it 'index' do
    expect(index).to eq(string.split("\n"))
  end

  it 'find' do
    expect(find(id)).to eq(["#{string.split("\n")[1]}\n", true])
  end

  it 'where' do
    expect(where(pattern)).to eq({ 2 => "#{string.split("\n")[1]}\n" })
  end

  it 'update' do
    expect(update(id, text)).to eq(true)
  end

  it 'delete' do
    expect(delete(id)).to eq(true)
  end

  it 'create' do
    create(name)
    expect(index).to eq(string.split("\n") + ['789'])
  end
end
