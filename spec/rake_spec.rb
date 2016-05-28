require 'spec_helper'
require 'lib/report_generator'

RakeSharedContext.root_dir = File.expand_path('..', __FILE__)

describe 'reports:generate' do
  include_context 'rake'

  it 'prerequisites should include "environment"' do
    expect(subject.prerequisites).to include('environment')
  end


  it 'generates the report' do
    expect(ReportGenerator).to receive(:generate)
    subject.invoke
  end
end
