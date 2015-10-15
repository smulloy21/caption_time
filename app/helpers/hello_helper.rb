module HelloHelper
  def captions_tree_for(captions)
    captions.map do |caption|
      render(caption) +
          (caption.captions.length > 0 ? content_tag(:ul, captions_tree_for(caption.captions.ranking), class: "replies caption-ul") : content_tag(:hr))
    end.join.html_safe
  end
end
