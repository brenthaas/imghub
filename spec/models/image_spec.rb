require 'spec_helper'

describe Image do
  describe "validations" do
    it { should validate_presence_of :url }
    it { should validate_uniqueness_of :url }
    it { should validate_presence_of :title }
  end
end
