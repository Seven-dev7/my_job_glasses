require './lib/find_file'
require './lib/csv_writer'
require 'fileutils'

describe 'csv_writer' do
  let(:json_file) { File.read(File.join('input_json_files', 'users.json')) }
  let(:csv_writer) { CsvWriter.new(parsed_json: json_file) }

  it "#initialize" do
    expect(csv_writer).to be_an_instance_of CsvWriter 
  end

  context 'bad initialization' do
    let(:bad_file) { File.read(File.join('fixtures', 'user_temp.csv')) }
    let(:nil_csv_writer) { CsvWriter.new(parsed_json: nil) }

    it "if parsed_json is nil" do
      expect{ nil_csv_writer }.to raise_error(ArgumentError, "parsed_json doit etre présent")
    end
  end

  context '#call' do
    it 'extension of file created is really .csv' do
      expect(File.extname(File.basename("/output_csv_files/user.csv"))).to eq '.csv'
    end

    it 'checks if file really created' do
      FileUtils.rm_f Dir.glob("./output_csv_files/*")
      expect(Dir.children('output_csv_files')).to be_empty
      csv_writer.call
      expect(File.directory?("./output_csv_files/")).to be_truthy 
      File.rename('output_csv_files/user.csv', "output_csv_files/user_temp.csv")
    end
  end
end
