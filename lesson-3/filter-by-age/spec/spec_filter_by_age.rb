# frozen_string_literal: true

require_relative '../filter_by_age'
require 'rspec'

describe 'Testing methods in the filter by age script' do
  let(:string) { "Мария Михайлова 25\nДмитрий Кузнецов 35\nАлександр Смирнов 25\nЕлена Васильева 30" }

  let(:age) { '25' }

  before do
    File.write(TASK_FILE, string)
    File.write(RESULT, '')
  end

  it 'read_file' do
    expect(read_file).to eq(string.split("\n"))
  end

  it 'set_search_age' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(age)
    expect(set_search_age).to eq(age)
  end

  it 'search_by_list' do
    expect(search_by_list(string.split("\n"), age)).to eq([string.split("\n")[1], string.split("\n")[3]])
  end

  it 'result' do
    search_by_list(string.split("\n"), age)
    expect(result).to eq([string.split("\n")[0], string.split("\n")[2]])
  end
end
