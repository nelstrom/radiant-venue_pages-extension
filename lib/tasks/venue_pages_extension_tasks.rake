namespace :radiant do
  namespace :extensions do
    namespace :venue_pages do
      
      desc "Moves data from page parts into fields"
      task :move => :environment do
        if index = Page.find_by_slug("venues")
          index.children.each do |venue|
            next if venue.title == "Map"

            [
              ["tel", "phone"],
              "lng",
              "lat",
              ["street-address", "street_address"],
              ["postal-code", "postcode"],
              ["url", "venue_url"]
            ].each do |names|

              part_name, field_name = names
              field_name = part_name if field_name.blank?
              
              if part = venue.part(part_name)
                venue.send("#{field_name}=", part.content)
                part.destroy
              end
            end

            venue.class_name = "VenuePage"
            if venue.save
              puts "updated #{venue.title}"
            end

          end
        end
      end
      
      desc "Runs the migration of the Venue Pages extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          VenuePagesExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          VenuePagesExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Venue Pages to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from VenuePagesExtension"
        Dir[VenuePagesExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(VenuePagesExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end
    end
  end
end
