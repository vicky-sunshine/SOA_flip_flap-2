require_relative 'tsv_buddy'
require 'yaml'
# This class convert from tsv to yml and viceverse
class FlipFlap
  include TsvBuddy
  # Do NOT create an initialize method
  def take_yaml(yml)
    @data = YAML.load(yml)
  end

  def to_yaml
    @data = @data.to_yaml
  end
end
