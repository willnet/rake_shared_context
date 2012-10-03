# RakeSharedContext

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

If you have `rake reports:users` like following.

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
describe "reports:genereate" do
  include_context "rake"
  before { ReportGenerator.stubs(:generate) }

  its(:prerequisites) { should include("environment") }

  it "generates the report" do
    subject.invoke
    ReportGenerator.should have_received(:generate)
  end
end
~~~

## Details

* It expects that rake files are located under lib/tasks
* It expects that file name is equal to task name so that you should write 'reports:generate' task at lib/tasks/reports.rake
* It expects that a argument is passed to `describe` is task name

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
