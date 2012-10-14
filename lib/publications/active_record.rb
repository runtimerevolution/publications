require 'orm_adapter/adapters/active_record'
require 'publications/core'

module Publications
    
    module ActiveRecord
      
      # Extend activerecord with methods to enable and configure Publications
      #
      def self.add_class_methods
        ::ActiveRecord::Base.extend Publications::ClassMethods
      end
      
      #
      # This module contains some helpers to handle schema migrations:
      #
      #   create_table :books do |t|
      #     t.publications
      #   end
      #      
      module Schema
        
        def self.add_migration_helpers
          ::ActiveRecord::ConnectionAdapters::Table.send :include, Publications::ActiveRecord::Schema
          ::ActiveRecord::ConnectionAdapters::TableDefinition.send :include, Publications::ActiveRecord::Schema
        end
          
        def publications
          column :active, :boolean          
          column :activated_at, :datetime, { :null => true }
          column :disabled_at, :datetime, { :null => true }                  
        end
        
        def remove_publications
          columns.delete(:active, :boolean) # => not working
          #column :activated_at, :datetime, { :null => true }
          #column :disabled_at, :datetime, { :null => true }                  
        end
        
      end
    end
end

