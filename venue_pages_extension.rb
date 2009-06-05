# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class VenuePagesExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/venue_pages"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :venue_pages
  #   end
  # end
  
  def activate
    # admin.tabs.add "Venue Pages", "/admin/venue_pages", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Venue Pages"
  end
  
end
