require 'csv'
require 'json'

class CsvWriter
  def initialize(parsed_json:)
    raise ArgumentError, "parsed_json doit etre présent" if parsed_json.nil?
    
    @parsed_json = parsed_json
  end

  def call
    csv_writer
  end

  private

  def csv_writer
    File.write('output_csv_files/user.csv', csv_generator)
  end

  def csv_generator
    csv_output = CSV.generate do |csv|
      csv << csv_header
      json_parsing.each do |hash|
        row = csv_header.map do |header|
          if header.split('.').count > 1
            [hash.dig(*header.split('.'))]
          elsif header == 'tags'
            [hash.values_at(header).join(', ')]
          else
            hash.values_at(*header)
          end
        end
        csv << row.flatten
      end
    end
  end

  def json_parsing
    JSON.parse(@parsed_json)
  end

  def csv_header
    json_parsing.map do |hash|
      format_keys_for_csv(hash)
    end.first
  end

  def format_keys_for_csv(hash, nested_key=nil)
    hash.each_with_object([]) do |(k,v),keys|
      k = "#{nested_key}.#{k}" unless nested_key.nil?
      if v.is_a? Hash
        keys.concat(format_keys_for_csv(v, k))
      else
        keys << k
      end
    end
  end
end
