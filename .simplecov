SimpleCov.start do
  add_filter '/spec/'
  add_group 'Generators', '/lib/generators'
  # add_filter '/vendor/bundle/'
  # minimum_coverage(90)
end
