module Seorel
  module Helper
    def render_meta_tags
      [render_title, render_description, render_open_graph, render_twitter_cards].join("\n").html_safe
    end

    def render_title
      content_tag :title, seorel_params.title
    end

    def render_description
      content_tag :meta, nil, name: 'description', content: seorel_params.description
    end

    def render_open_graph
      [
        content_tag(:meta, nil, name: 'og:type', content: 'website'),
        content_tag(:meta, nil, name: 'og:title', content: seorel_params.title),
        content_tag(:meta, nil, name: 'og:description', content: seorel_params.description),
        content_tag(:meta, nil, name: 'og:image', content: seorel_params.image),
        content_tag(:meta, nil, name: 'og:locale', content: I18n.locale.to_s)
      ].join("\n").html_safe
    end

    def render_twitter_cards
      [
        content_tag(:meta, nil, name: 'twitter:card', content: 'summary'),
        content_tag(:meta, nil, name: 'twitter:url', content: request.url),
        content_tag(:meta, nil, name: 'twitter:title', content: seorel_params.title),
        content_tag(:meta, nil, name: 'twitter:description', content: seorel_params.description),
        content_tag(:meta, nil, name: 'twitter:image', content: seorel_params.image)
      ].join("\n").html_safe
    end
  end
end
