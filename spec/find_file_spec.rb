require './lib/find_file'

describe 'find_file' do
  let(:file) { FindFile.new(value: 1) }
  let(:json_file) { File.read(File.join('input_json_files', 'users.json')) }

  context 'good initialization' do
    it "#initialize" do
      expect(file).to be_an_instance_of FindFile 
    end
  end

  context 'bad initialization' do
    let(:bad_file_string) { FindFile.new(value: '') }
    let(:bad_file_array) { FindFile.new(value: [] ) }
    let(:bad_file_hash) { FindFile.new(value: {} ) }
    let(:bad_file_nil) { FindFile.new(value: nil ) }

    it "if value is String" do
      expect{ bad_file_string }.to raise_error(ArgumentError, "value n'est pas au bon format")
    end

    it "if value is Array" do
      expect{ bad_file_array }.to raise_error(ArgumentError, "value n'est pas au bon format")
    end

    it "if value is Hash" do
      expect{ bad_file_hash }.to raise_error(ArgumentError, "value n'est pas au bon format")
    end

    it "if value is nil" do
      expect{ bad_file_nil }.to raise_error(ArgumentError, "value ne peut etre nil")
    end
  end

  it "#choose_file" do
    expect(file.choose_file).to eq json_file 
  end

  it "self.display_file" do
    expect(FindFile.display_file.class).to be Array 
  end

end
