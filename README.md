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
In your controllers you may add\_metatags either like a before\_filter or within a method.

```ruby
class PostsController < ApplicationController

  def index
    ###
    # Custom meta tags
    add_metatags({
      title: 'My custom meta title',
      description: 'My custom meta description'
    })

    ...
  end

  def show
    @post = Post.find(params[:id])
    ###
    # Extract meta tags info from your Seorelified Model
    add_metatags(@post)

    ...
  end

end
```

## Views

In your layout &lt;head&gt;&lt;/head&gt; section just call the `render_meta_tags` helper:

```ruby
<%=render_meta_tags %>
```

## Contributing
Submitting a Pull Request:

1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Implement your feature or bug fix.
4. Add, commit, and push your changes.
5. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## This project rocks and uses MIT-LICENSE.
