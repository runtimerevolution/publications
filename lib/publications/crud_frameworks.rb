# Support for edit forms for publications related data in crud frameworks
# Currently only ActiveAdmin is supported
#
module ActiveAdmin 
  class FormBuilder 

    def publications(options={}) 
      _buffered(:publications,options) 
    end 

    def _buffered(name,options) 
      super_name = ::Formtastic::SemanticFormBuilder.instance_method(name).bind(self) 

      content = with_new_form_buffer do 
        super_name.call(options) 
      end 

      return content.html_safe unless @inputs_with_block 
      form_buffers.last << content.html_safe 
    end 

  end 
end 

module Formtastic 
  class SemanticFormBuilder < ActionView::Helpers::FormBuilder 

    def publications(options={}) 
      input(:active, :label => 'Active', :required => false, :hint => 'Is this item published ?')    
      input(:activated_at, :label => 'Publish date', :required => false, :hint => 'Publication start date. Ignored if blank.')
      input(:disabled_at, :label => 'Unpublish date', :required => false, :hint => 'Publication end date. Ignored if blank.')      
    end 

  end 
end 
