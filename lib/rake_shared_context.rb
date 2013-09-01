# -*- coding: utf-8 -*-
require "rake_shared_context/version"
require "rake"
require 'pry'
require "pathname"

class RakeSharedContext
  class << self
    def root_dir
      return @root_dir if @root_dir

      if defined? Rails
        Rails.root
      elsif defined? Padrino
        Padrino.root
      else
        Pathname.pwd
      end
    end

    def root_dir=(dir)
      @root_dir = Pathname.new(dir)
    end

    def rake_dir
      return @rake_dir if @rake_dir

      root_dir.join('lib', 'tasks')
    end

    def rake_dir=(dir)
      @rake_dir = Pathname.new(dir)
    end
  end
end

begin
  require "rspec/core"
  shared_context "rake" do
    let(:rake)      { Rake::Application.new }
    let(:task_name) { self.class.top_level_description }
    subject         { rake[task_name] }

    before do
      loaded_files = []
      Rake.application = rake
      rake_dir = RakeSharedContext.rake_dir

      Dir.glob(rake_dir.join("*.rake")).each do |task|
        filename_without_ext = File.basename(task.sub(/.rake$/, ''))
        Rake.application.rake_require(filename_without_ext, [rake_dir.to_s], loaded_files)
      end

      Rake::Task.define_task(:environment)
    end
  end
rescue LoadError
end
