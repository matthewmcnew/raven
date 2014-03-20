require "minitest_helper"

describe Assignment do
  subject { Assignment.new }
  it { must validate_presence_of(:name) }
end