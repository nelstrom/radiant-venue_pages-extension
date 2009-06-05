module PageExtensions

  def self.included(base)
    base.extend ClassMethods
  end
  
  def is_venue?
    class_name == "VenuePage"
  end

  module ClassMethods
    
  end

end
  