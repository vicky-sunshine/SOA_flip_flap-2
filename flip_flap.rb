require_relative 'tsv_buddy'
require 'yaml'
# This class convert from tsv to yml and viceverse
class FlipFlap
  # Do NOT create an initialize method
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
  	# Get header names and add a tab between elements
	result = yml[0].keys.reduce { |a, e| "#{a}\t#{e}" }

	# Get values of objects and add them in a new line separated by tabs
	@data.each do |element|
	  result += "\n#{element.values.reduce { |a, e| "#{a}\t#{e}" }}"
	end

	@data = result

  end
end

# class Tester
#     include TsvBuddy
#  end

# t = Tester.new
# result = t.take_tsv(File.read('./data/survey.tsv'))
# puts t.to_tsv
