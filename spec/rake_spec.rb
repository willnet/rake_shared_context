require 'spec_helper'
require 'lib/report_generator'

describe "reports:generate" do
  before do
    RakeSharedContext.root_dir = File.expand_path('..', __FILE__)
  end

  include_context "rake"

  its(:prerequisites) { should include("environment") }

  it "generates the report" do
    ReportGenerator.should_receive(:generate)
    subject.invoke
  end
end

