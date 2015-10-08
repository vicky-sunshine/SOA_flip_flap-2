require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

# This class convert from tsv to yml and viceverse
class FlipFlap
  include TsvBuddy
  include YamlBuddy
end
