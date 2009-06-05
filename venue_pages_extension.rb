# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class VenuePagesExtension < Radiant::Extension
  version "0.1"
  description "Add extra fields to the Page model, making it easy to create pages for venues."
  url "http://wiki.github.com/nelstrom/radiant-venue_pages-extension"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :venue_pages
  #   end
  # end
  
  def activate
    VenuePage
    Page.send :include, PageExtensions
    admin.page.edit.add :form, "venue_page_fields", :before => "form_bottom"
  end
  
  def deactivate
  end
  
end
