module BootstrapHelper
  def horizontal_form_field(item, lbl)
    Rails.logger.info("label: #{lbl}")
    content_tag :div, :class => 'control-group' do 
      content_tag(:label, lbl, :class => 'control-label')+
      content_tag(:div, :class => 'controls') do 
        item
      end
    end
  end
end