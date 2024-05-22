# frozen_string_literal: true

require_relative '../method_file_controller'
require 'rspec'

RSpec.describe 'Testing the file controller' do
  let(:string) { "123\n321\n456" }

  before { File.write(TASK_FILE, string) }

  describe '#index' do
    subject { index }
    let(:out) { "\nСодержимое файла:\n1: 123\n2: 321\n3: 456\n" }

    it 'Output file contents' do
      expect { subject }.to output(out).to_stdout
    end
  end

  describe '#find' do
    subject { find(id) }

    context 'Correct id entered' do
      let(:out) { "\nСтрока с номером 2: 321\n" }
      let(:id) { 2 }

      it 'Output of the requested line' do
        expect { subject }.to output(out).to_stdout
      end
    end

    context 'Invalid id entered' do
      let(:out) { "\nСтроки с таким номером не существует.\n" }
      let(:id) { 5 }

      it 'Output of the requested line' do
        expect { subject }.to output(out).to_stdout
      end
    end
  end

  describe '#where' do
    subject { where(pattern) }

    context 'Entering the correct pattern' do
      let(:out) { "\nСтроки, содержащие введённый паттерн:\n1: 123\n2: 321\n" }
      let(:pattern) { '1' }

      it 'Displays a list of strings with the entered pattern' do
        expect { subject }.to output(out).to_stdout
      end
    end

    context 'Entering an incorrect pattern' do
      let(:out) { "\nСтрок с введённым паттерном нет.\n" }
      let(:pattern) { 'a' }

      it 'Displaying a message about the absence of lines with the entered pattern' do
        expect { subject }.to output(out).to_stdout
      end
    end
  end

  describe '#update' do
    subject { update(id, text) }

    context 'Correct id entered' do
      let(:out) { "\nОбновление строки #{id} произошло успешно.\n" }
      let(:id) { 2 }
      let(:text) { 456 }

      it 'Displays a list of strings with the entered pattern' do
        expect { subject }.to output(out).to_stdout
      end
    end

    context 'Invalid id entered' do
      let(:out) { "\nСтроки с таким номером не существует.\n" }
      let(:id) { 5 }
      let(:text) { 456 }

      it 'Displaying a message about the non-existence of a line with id number' do
        expect { subject }.to output(out).to_stdout
      end
    end
  end

  describe '#delete' do
    subject { delete(id) }

    context 'Correct id entered' do
      let(:out) { "\nУдаление строки произошло успешно.\n" }
      let(:id) { 2 }

      it 'Displaying a message about the successful deletion of a row with id number' do
        expect { subject }.to output(out).to_stdout
      end
    end

    context 'Invalid id entered' do
      let(:out) { "\nСтроки с таким номером не существует.\n" }
      let(:id) { 5 }

      it 'Displaying a message about the non-existence of a line with id number' do
        expect { subject }.to output(out).to_stdout
      end
    end
  end

  describe '#create' do
    subject { create(name) }
    context 'Entering a new line' do
      let(:out) { "\nСтрока успешно добавлена.\n" }
      let(:name) { '789' }

      it 'Displaying a message about the successful creation of a row' do
        expect { subject }.to output(out).to_stdout
      end
    end
  end
end
