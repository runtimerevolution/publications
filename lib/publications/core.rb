module Publications
  
  module ClassMethods
    def has_publish_control
      include Publications::PublishValidations
    end
  end
  
    
  module PublishValidations

    def self.included(base)
      base.class_eval do
        scope :active_by_flag, -> { where(:active => true) }
        scope :active_by_dates, lambda { { :conditions => [" #{self.table_name}.id not in ( select #{self.table_name}.id 
                                                                                      from #{self.table_name} 
                                                                                      where #{self.table_name}.activated_at > ? 
                                                                                      or #{self.table_name}.disabled_at < ? ) ", (Time.now.utc+Time.now.utc_offset), (Time.now.utc+Time.now.utc_offset)] } }
      
      end
      base.extend(ClassMethods).active
    end
  
    module ClassMethods
    
      def active
        active_by_flag.active_by_dates
      end
      
      #TODO - add inactive
      
    end

  end
end
