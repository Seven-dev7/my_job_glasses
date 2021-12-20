require './main'
require './lib/find_file'
require './lib/csv_writer'
require './lib/communication_display'

describe Main do
  context 'call FindFile' do
    it "init" do
      allow(FindFile).to receive(:new).with(value: 1).and_call_original
      described_class.call
    end
  end

  context 'call CsvWriter' do
    let(:parsed_json) { File.read(File.join('input_json_files', 'users.json')) }
    it "init" do
      allow(CsvWriter).to receive(:new).with(parsed_json: parsed_json).and_call_original
      described_class.call
    end
  end

  context 'call CommunicationDisplay' do
    it "#introduction_display" do
      allow(CommunicationDisplay).to receive(:introduction).and_call_original
      described_class.call
    end

    it "#get_value" do
      allow(CommunicationDisplay).to receive(:chosen_value).and_call_original
      described_class.call
    end

    it "#get_ur_file" do
      allow(CommunicationDisplay).to receive(:get_ur_file).and_call_original
      described_class.call
    end
  end
end
