module Naturable
  extend ActiveSupport::Concern

  def build_natures(nature_type, natures)
    natures.split(',').each do |nature|
      send(nature_type).build(nature: nature.strip.capitalize)
    end
  end

  def erase_natures(nature_type)
    send(nature_type).clear
  end

  def natures(nature_type)
    send(nature_type).map(&:nature).join(', ')
  end

  def replace_natures(nature_type, natures)
    if natures(nature_type) != natures
      erase_natures(nature_type)
      build_natures(nature_type, natures)
    end
  end
end
