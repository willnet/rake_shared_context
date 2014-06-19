require 'spec_helper'
require 'lib/report_generator'

describe "reports:generate" do
  before do
    RakeSharedContext.root_dir = File.expand_path('..', __FILE__)
  end

  include_context "rake"

  it 'prerequisites should include "environment"' do
    expect(subject.prerequisites).to include("environment")
  end


  it "generates the report" do
    ReportGenerator.should_receive(:generate)
    subject.invoke
  end
end
