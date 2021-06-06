require_relative '../lib/monotonic_time'

require 'minitest/autorun'
require 'minitest-spec-context'

describe MonotonicTime do
  subject{MonotonicTime.now}

  describe "#initialize" do
    it "the time spent in the block is returned as the value of the block" do
      expect(subject.instance_variable_get(:@boot_time))\
        .must_equal(Sys::Uptime.boot_time)
    end

    it "the time spent in the block is returned as the value of the block" do
      expect(subject.instance_variable_get(:@seconds_since_boot).round(3))\
        .must_equal(Process.clock_gettime(Process::CLOCK_MONOTONIC).round(3))
    end
  end

  describe "#to_s" do
    it "returns an instance of string" do
      expect(subject.to_s.class).must_equal(String)
    end
  end

  describe "#to_time" do
    it "returns an instance of time" do
      expect(subject.to_time.class).must_equal(Time)
    end
  end
end
