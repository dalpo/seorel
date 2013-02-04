# Seorel

SEO Meta Engine for Ruby on Rails

## Quick setup


`Gemfile.rb`:

```ruby
gem 'seorel', github: 'dalpo/seorel'
```

`Console`:
```bash
% bundle
% bundle exec rake seorel:install:migrations
% bundle exec rake db:migrate
```

## Default configuration options

```bash
% rails generate seorel:config
```

Will generate the `seorel_config.rb` initializer:

```ruby
Seorel.configure do |config|
  # config.default_title = nil
  # config.default_description = nil
  # config.default_image = nil
  # config.prepend_title = nil
  # config.append_title  = nil
end
```


# Example

## Extending model

```ruby
class Post < ActiveRecord::Base

  extend Seorelify
  seorelify :title

end
```


## Controllers
In your controllers you may add\_seorel\_meta either like a before\_filter or within a method.

```ruby
class PostsController < ApplicationController

  def index
    ###
    # Custom meta tags
    add_seorel_meta({
      title: 'My custom meta title',
      description: 'My custom meta description'
    })

    ...
  end

  def show
    @post = Post.find(params[:id])
    ###
    # Extract meta tags info from your Seorelified Model
    add_seorel_meta(@post)

    ...
  end

end
```

## Views

In your layout <head></head> section just call the paginate helper:

```ruby
<%=render_meta_tags %>
```


### This project rocks and uses MIT-LICENSE.
