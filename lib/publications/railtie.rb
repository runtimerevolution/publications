require 'publications/active_record'

module Publications
  class Railtie < Rails::Railtie

    initializer 'publications.insert_into_active_record' do
      ActiveSupport.on_load :active_record do
        Publications::ActiveRecord.add_class_methods        
        Publications::ActiveRecord::Schema.add_migration_helpers              
      end
    end

  end
end

