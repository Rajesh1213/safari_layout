require 'generators/safari'

module Safari
  module Generators
    class LayoutGenerator < Base
      argument :layout_name, :type => :string, :default => 'application', :banner => 'layout_name'

      class_option :haml, :desc => 'Generate HAML for view, and SASS for stylesheet.', :type => :boolean

      def create_layout
        
        copy_file 'layout.html.erb', "app/views/layouts/#{file_name}.html.erb"
        copy_file 'stylesheet.css', "app/assets/stylesheets/#{file_name}.css"
        copy_file 'bootstrap.min.js', "app/assets/javascripts/bootstrap.min.js"
       
      end

       def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
       end

      private

      def file_name
        layout_name.underscore
      end
    end
  end
end