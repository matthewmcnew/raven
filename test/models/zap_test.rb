require "minitest_helper"

describe Zap do
  subject { Zap.new }
  it { must belong_to(:student) }
  it { must belong_to(:assignment) }
  it { must validate_presence_of(:assignment) }
  it { must validate_presence_of(:student) }
end
