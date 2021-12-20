class FindFile
  def initialize(value:)
    raise ArgumentError, "value n'est pas au bon format" if [String, Array, Hash].include? value.class
    raise ArgumentError, "value ne peut etre nil" if value.nil?

    @value = value
  end

  def choose_file
    File.read("input_json_files/#{Dir.children('input_json_files')[@value - 1]}")
  end

  def self.display_file
    count = 1
    get_input_folder.each do |file_name|
      p "#{count} - #{file_name}"
      count += 1
    end  
  end

  private

  def self.get_input_folder
    Dir.children('input_json_files')
  end  
end
