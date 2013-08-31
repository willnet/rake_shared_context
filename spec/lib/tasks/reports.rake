namespace :reports do
  desc "Generate report"

  task :generate => :environment do
    ReportGenerator.generate
  end

  task :environment do
    # do nothing
  end
end
