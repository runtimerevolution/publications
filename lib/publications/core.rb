module Publications

  module ClassMethods
    def has_publish_control
      include Publications::PublishValidations
    end
  end


  module PublishValidations

    def self.included(base)
      base.class_eval do
        scope :active,          -> { active_by_dates.active_by_flag }
        scope :active_by_flag,  -> { where(:active => true) }
        scope :active_by_dates, -> { where("(#{self.table_name}.activated_at <= ? AND #{self.table_name}.disabled_at IS NULL) OR (#{self.table_name}.activated_at IS NULL AND #{self.table_name}.disabled_at IS NULL) OR (#{self.table_name}.activated_at <= ? AND #{self.table_name}.disabled_at > ?)",
          Time.now.utc+Time.now.utc_offset,
          Time.now.utc+Time.now.utc_offset,
          Time.now.utc+Time.now.utc_offset)
        }

      end
      
    end

    # TODO refactor
    def is_inactive_since(datetime)
      !active &&
      updated_at < datetime &&
      (activated_at == nil || activated_at  < datetime) &&
      (disabled_at  == nil || disabled_at   < datetime)
    end

  end
end
