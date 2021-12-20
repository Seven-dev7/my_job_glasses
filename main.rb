require_relative 'lib/find_file'
require_relative 'lib/csv_writer'
require_relative 'lib/communication_display'

class Main
  def self.call
    introduction_display
    display_file
    csv_writer
    get_ur_file
  end

  private

  def self.introduction_display
    CommunicationDisplay.introduction
  end

  def self.display_file
    FindFile.display_file
  end

  def self.csv_writer
    CsvWriter.new(parsed_json: get_file).call
  end

  def self.get_file
    FindFile.new(value: get_value).choose_file
  end

  def self.get_value
    CommunicationDisplay.chosen_value
  end

  def self.get_ur_file
    CommunicationDisplay.get_ur_file
  end
end

Main.call
