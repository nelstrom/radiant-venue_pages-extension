module PageExtensions
  include Radiant::Taggable

  def self.included(base)
    base.extend ClassMethods
  end
  
  def is_venue?
    class_name == "VenuePage"
  end

  module ClassMethods
    
  end

  desc "The namespace for venue information."
  tag "venue" do |tag|
    tag.expand if tag.locals.page.is_venue?
  end
  
  [
    ["street_address", "street"],
    "city",
    "postcode",
    "phone",
    ["venue_url", "website"],
    ["lat", "latitude"],
    ["lng", "longitude"]
  ].each do |names|
    
    field, label = names
    label = field if label.blank?
    
    desc "Show contents only if the #{label} has been supplied."
    tag "venue:if_#{field}" do |tag|
      tag.expand unless tag.locals.page.send(field).blank?
    end
  
    desc "Show contents only if the #{label} is not blank."
    tag "venue:unless_#{field}" do |tag|
      tag.expand if tag.locals.page.send(field).blank?
    end

    desc "Output the #{label} for this venue."
    tag "venue:#{field}" do |tag|
      if %w{ postcode phone }.include?(field)
        tag.locals.page.send(field).strip.gsub(/\s/, "&nbsp;")
      else
        tag.locals.page.send(field).strip
      end
    end

  end

end
