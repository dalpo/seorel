# Decomment this line if you want to use Globalize to magage seo translations
# require 'seorel/globalize'

# Seorel configurations:
Seorel.configure do |config|
  ###
  # Title meta tag configurations:
  #
  # config.default_prepend_title = nil
  # config.default_title = nil
  # config.default_append_title  = nil

  ###
  # Description meta tag configurations:
  #
  # config.default_prepend_description = nil
  # config.default_description = nil
  # config.default_append_description  = nil

  ###
  # Configure a default meta keywords:
  #
  # config.default_keywords = 'Ruby on Rails,Seorel,SEO'

  ###
  # Configure a default share image:
  #
  # config.default_image = nil

  ###
  # Choose when to save seorel meta tags:
  # - `:empty` Store values only if title o description are empty
  # - `:changed` Store values on every record save
  #
  # config.store_seorel_if = :empty # Available values :empty | :changed

  ###
  # Add custom Open Graph meta tags:
  #
  # config.default_og_metas = {
  #   type: 'website'
  # }

  ###
  # Add custom Twitter card meta tags:
  #
  # config.default_twitter_metas = {
  #   card: 'summary_large_image'
  # }
end
