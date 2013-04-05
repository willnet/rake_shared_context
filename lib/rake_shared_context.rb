require "rake_shared_context/version"
require "rake"

begin
  require "rspec/core"
  shared_context "rake" do
    let(:rake)      { Rake::Application.new }
    let(:task_name) { self.class.top_level_description }
    let(:task_path) { "lib/tasks/#{task_name.split(":").first}" }
    subject         { rake[task_name] }

    def loaded_files_excluding_current_rake_file
      $".reject {|file| file == Rails.root.join("#{task_path}.rake").to_s }
    end

    before do
      Rake.application = rake
      Dir::glob("lib/tasks/*.rake").each do |task|
        Rake.application.rake_require(task.sub(/.rake$/,''), [Rails.root.to_s], loaded_files_excluding_current_rake_file)
      end
       
      Rake::Task.define_task(:environment)
    end
  end
rescue LoadError
end
