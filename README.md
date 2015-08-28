# Seorel

Ruby on Rails SEO Metatags plugins for ActiveRecord models

[![Gem Version](https://badge.fury.io/rb/seorel.png)](http://badge.fury.io/rb/seorel)
[![Code Climate](https://codeclimate.com/github/dalpo/seorel.png)](https://codeclimate.com/github/dalpo/seorel)
[![Build Status](https://travis-ci.org/dalpo/seorel.svg?branch=master)](https://travis-ci.org/dalpo/seorel)

## Rails Setup


`Gemfile.rb`:

```ruby
gem 'seorel', '~> 0.2.2'

# the edge version can be had using:
# gem 'seorel', github: 'dalpo/seorel'
```

`Console`:
```bash
$ bundle install
$ bundle exec rake seorel:install:migrations
$ bundle exec rake db:migrate
```

## Generate configuration initializer for the default options

```bash
% rails generate seorel:config
```

Will generate the `seorel_config.rb` initializer to customize the default values:

```ruby
Seorel.configure do |config|
  # config.default_prepend_title = nil
  # config.default_title = nil
  # config.default_append_title  = nil
  #
  # config.default_prepend_description = nil
  # config.default_description = nil
  # config.default_append_description  = nil
  #
  # config.default_image = nil
  #
  # config.store_seorel_if = :empty # Available values :empty | :changed
end
```


## Usage

### Sample model

For instance generate a post model:
```ruby
rails generate model post title:string description:text, publish_date:date
```

Edit `app/models/post.rb`:
```ruby
class Post < ActiveRecord::Base
  extend Seorelify
  seorelify(title: :customized_title, description: :description, image: :share_image)

  def customized_title
    "THE BLOG: #{self.title}"
  end
end
```

This will use the `customized_title` and the `description` methods as references to generate automatically the related metatags.
Note that the title and description will be sanitized from HTML and truncated to 255 characters.


### Controllers
In your controllers you may add\_metatags either like a before\_filter or within a method.

```ruby
class PostsController < ApplicationController

  def index
    ###
    # Custom meta tags
    add_metatags({
      title: 'My custom meta title',
      description: 'My custom meta description',
      image: '/sample_image.png'
    })

    ...
  end

  def show
    @post = Post.find(params[:id])
    ###
    # Extract meta tags info from your Seorelified Model
    add_metatags @post

    ...
  end

  def history
    ...
  end
end
```

In case of missing `add_metatags` declaration in controller actions, you can define metatags through rails `L10n` library. Simply by defining your locale strings for seorel.

For instance `seorel.en.yml`:

```yaml
# encoding: utf-8
en:
  seorel:
    # controller_name:
    #   action_name:
    #     prepend_title: '...'
    #     title: '...'
    #     append_title: '...'
    #
    #     prepend_description: '...'
    #     description: '...'
    #     append_description: '...'

    posts:
      show:
        prepend_title: "Details for: "

      history:
        title: "Posts history metatitle"
        description: "Posts history metadescriprion"

    tags:
      index:
        title: "Tag list"
        description: "Tag list metadescription"
```
Where `posts` and `tags` are controller names, while `history` and `index` are their actions.

### Views

In your layout &lt;head&gt;&lt;/head&gt; section just call the `render_meta_tags` helper:

```html
<head>
  <%=render_meta_tags %>
  ...
</head>
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

Copyright 2014 Andrea Dal Ponte

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
