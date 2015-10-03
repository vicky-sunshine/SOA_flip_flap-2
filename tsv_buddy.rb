# Module that can be included (mixin) to create and parse TSV data
module TsvBuddy
  # @data should be a data structure that stores information
  #  from TSV or Yaml files. For example, it could be an Array of Hashes.
  attr_accessor :data
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    header = []
    @data ||= []
    tsv.each_line.with_index do |line,index|
      if index == 0
        # Get header names
        header = line.gsub("\n", '').split("\t")
      else
        # Get tuple and add as an obj
        @data << Hash[header.zip line.gsub("\n", '').split("\t")]
      end
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    result = @data[0].keys.reduce { |a, e| "#{a}\t#{e}" }

    # Get values of objects and add them in a new line separated by tabs
    @data.each do |element|
      result += "\n#{element.values.reduce { |a, e| "#{a}\t#{e}" }}"
    end

    result
  end
end
