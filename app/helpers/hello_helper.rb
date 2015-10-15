module HelloHelper
  def hello(name)
    "hello #{name}"
  end

  def helloHTML(name)
    '<li>'.html_safe + name + '</li>'.html_safe
  end

  def displayCaptions(object)
    object.captions.each do |caption|
      render partial: "captions/caption", locals: { caption: caption,  }
      # displayCaptions(caption)
      #
      # string += '<%= link_to "text" images_path %>'.html_safe
      # #   <%= f.text_field(:text, {:class => 'form-control'}) %>
      # #   <%= f.submit(:class => 'btn', :value => 'Reply') %>
      # # <% end %>
      #
      # string += '<ul>'
      # string += displayCaptions(caption)
      # string += '</ul>'
      # string += '</li>'
    end
    # return raw(string)
  end

  def captions_tree_for(captions)
    captions.map do |caption|
      render(caption) +
          (caption.captions.length > 0 ? content_tag(:ul, captions_tree_for(caption.captions), class: "replies caption-ul") : content_tag(:hr))
    end.join.html_safe
  end
end
