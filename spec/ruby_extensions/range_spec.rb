require File.expand_path("#{File.dirname(__FILE__)}/../spec_helper")

describe Range do
  describe "#intersect?" do
    it "is false for an endpoint-exclusive interval whose #last is <= the argument's #first" do
      (2...4).intersects?(5..10).should be_false
      (2...5).intersects?(5..10).should be_false
    end

    it "is true for an endpoint-inclusive interval whose #last is == to the argument's #first" do
      (2..5).intersects?(5..10).should be_true
      (5..5).intersects?(5..10).should be_true
    end

    it "is true for an endpoint-inclusive interval whose #last is == to the argument's #last" do
      (5..5).intersects?(1..5).should be_true
    end

    it "is false for an interval whose #first is >= than the argument's #last" do
      (11...15).intersects?(5..10).should be_false
      (10...15).intersects?(5..10).should be_false
    end

    it "is true for an interval whose #first is between the #first and #last of the argument" do
      (5...10).intersects?(4..6).should be_true
    end

    it "is true for an interval whose #last is between the #first and #last of the argument" do
      (4...6).intersects?(5..10).should be_true
    end

    it "is true for an interval that is totally contained by its argument" do
      (4...6).intersects?(1..10).should be_true
    end

    it "is true for an interval that totally contains its argument" do
      (1...10).intersects?(4..6).should be_true
    end
  end

  describe "#transpose" do
    it "returns a range whose start and end values are adjusted by the given amount" do
      (1...5).transpose(5).should == (6..10)
      (5...6).transpose(-2).should == (3..4)
    end
  end
end