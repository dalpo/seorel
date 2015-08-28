module Seorel
  module Helper
    def seorel_locale
      locale = (I18n.locale.to_s.size == 2) ? "#{I18n.locale}_#{I18n.locale}" : I18n.locale.to_s
      "#{locale[0..1].downcase}_#{locale[3..4].upcase}"
    end

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
        content_tag(:meta, nil, property: 'og:type', content: 'website'),
        content_tag(:meta, nil, property: 'og:url', content: request.url),
        content_tag(:meta, nil, property: 'og:title', content: seorel_params.title),
        content_tag(:meta, nil, property: 'og:description', content: seorel_params.description),
        content_tag(:meta, nil, property: 'og:image', content: seorel_params.image),
        content_tag(:meta, nil, property: 'og:locale', content: seorel_locale)
      ].join("\n").html_safe
    end

    def render_twitter_cards
      [
        content_tag(:meta, nil, name: 'twitter:card', content: 'summary_large_image'),
        content_tag(:meta, nil, name: 'twitter:url', content: request.url),
        content_tag(:meta, nil, name: 'twitter:title', content: seorel_params.title),
        content_tag(:meta, nil, name: 'twitter:description', content: seorel_params.description),
        content_tag(:meta, nil, name: 'twitter:image', content: seorel_params.image)
      ].join("\n").html_safe
    end
  end
end
