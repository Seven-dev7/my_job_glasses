require './lib/find_file'
require './lib/csv_writer'

describe 'csv_writer' do
  let!(:json_file) { File.read(File.join('input_json_files', 'users.json')) }
  let(:csv_writer) { CsvWriter.new(parsed_json: json_file) }

  it "#initialize" do
    expect(csv_writer).to be_an_instance_of CsvWriter 
  end

  context 'bad initialization' do
    let(:bad_file) { File.read(File.join('fixtures', 'user_temp.csv')) }
    let(:bad_csv_writer) { CsvWriter.new(parsed_json: 1) }
    let(:nil_csv_writer) { CsvWriter.new(parsed_json: nil) }

    xit "if parsed_json is not String" do
      expect{ bad_csv_writer }.to raise_error(ArgumentError, "format invalide")
    end

    it "if parsed_json is nil" do
      expect{ nil_csv_writer }.to raise_error(ArgumentError, "parsed_json doit etre présent")
    end
  end

  context '#call' do
    it 'extension of file created is really .csv' do
      expect(File.extname(File.basename("/output_csv_files/user.csv"))).to eq '.csv'
    end

    it 'checks if file really created' do
      expect(Dir.children('output_csv_files')).to be_empty
      csv_writer.call
      expect(Dir.children('output_csv_files')).not_to be_empty
      File.rename('output_csv_files/user.csv', "output_csv_files/user_temp.csv")
    end
  end
end
