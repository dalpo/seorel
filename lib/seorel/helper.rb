module Seorel
  module Helper

    def render_meta_tags
      metas = ''
      metas+= render_title
      metas+= render_description
      metas+= render_open_graph
      metas+= render_twitter_cards
      metas.html_safe
    end

    def render_title
      content_tag :title, seorel_params.full_title
    end

    def render_description
      content_tag :meta, nil, name: 'description', content: seorel_params.description
    end

    def render_open_graph
      metas = ''
      metas+= content_tag :meta, nil, name: 'og:type', content: 'website'
      metas+= content_tag :meta, nil, name: 'og:title', content: seorel_params.full_title
      metas+= content_tag :meta, nil, name: 'og:description', content: seorel_params.description
      metas+= content_tag :meta, nil, name: 'og:image', content: seorel_params.image
      metas+= content_tag :meta, nil, name: 'og:locale', content: I18n.locale.to_s
      metas.html_safe
    end

    def render_twitter_cards
      metas = ''
      metas+= content_tag :meta, nil, name: 'twitter:card', content: 'summary'
      metas+= content_tag :meta, nil, name: 'twitter:url', content: url_for
      metas+= content_tag :meta, nil, name: 'twitter:title', content: seorel_params.full_title
      metas+= content_tag :meta, nil, name: 'twitter:description', content: seorel_params.description
      metas+= content_tag :meta, nil, name: 'twitter:image', content: seorel_params.image
      metas.html_safe
    end

  end
end
