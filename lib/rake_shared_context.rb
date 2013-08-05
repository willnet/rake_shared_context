require "rake_shared_context/version"
require "rake"

begin
  require "rspec/core"
  shared_context "rake" do
    let(:rake)      { Rake::Application.new }
    let(:task_name) { self.class.description }
    subject         { rake[task_name] }

    before do
      loaded_files = []
      Rake.application = rake
      Dir::glob("lib/tasks/*.rake").each do |task|
        Rake.application.rake_require(task.sub(/.rake$/,''), [Rails.root.to_s], loaded_files)
      end

      Rake::Task.define_task(:environment)
    end
  end
rescue LoadError
end
