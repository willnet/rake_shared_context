# RakeSharedContext

[![Build Status](https://travis-ci.org/willnet/rake_shared_context.png)](https://travis-ci.org/willnet/rake_shared_context)
[![Gem Version](https://badge.fury.io/rb/rake_shared_context.png)](http://badge.fury.io/rb/rake_shared_context)
[![Coverage Status](https://coveralls.io/repos/willnet/rake_shared_context/badge.png)](https://coveralls.io/r/willnet/rake_shared_context)
[![Stories in Ready](https://badge.waffle.io/willnet/rake_shared_context.png?label=ready&title=Ready)](https://waffle.io/willnet/rake_shared_context)

shared_context for rake tasks.

This gem is inspired by [this post](http://robots.thoughtbot.com/post/11957424161/test-rake-tasks-like-a-boss).

## Installation

Add this line to your application's Gemfile:

    gem 'rake_shared_context'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_shared_context

## Usage

If you have `rake reports:generate` like following.

~~~
# lib/tasks/reports.rake
namespace :reports do
  desc "Generate report"

  task :generate => :environment do
    ReportGenerator.generate
  end
end
~~~

Then you can write following.

~~~
# spec/lib/tasks/reports_rake_spec.rb

require 'spec_helper'
describe "reports:generate" do
  include_context "rake"

  it 'prerequisites should include "environment"' do
    expect(subject.prerequisites).to include('environment')
  end

  it "generates the report" do
    expect(ReportGenerator).to receive(:generate)
    subject.invoke
  end
end
~~~

## Details

* It expects that rake files are located under lib/tasks
* It expects that a argument is passed to `describe` is task name

## Supported versions

* Ruby 1.9.3, 2.0.0, 2.1.2
* Rspec 2, 3

## Development

To set up a development environment, do following

```sh
bundle install
appraisal install
bundle exec appraisal rspec-2 rake # test with rspec 2
bundle exec appraisal rspec-3 rake # test with rspec 3
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
