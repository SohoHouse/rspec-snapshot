require "spec_helper"
require "active_support/core_ext/string"
require "html_serializer"

describe RSpec::Snapshot::Matchers do
  it "snapshot hash" do
    hash = { a: 1, b: 2 }
    expect(hash).to match_snapshot("hash")
  end

  it "snapshot array" do
    array = [1, 2]
    expect(array).to match_snapshot("array")
  end

  context "when snapshotting non-string objects" do
    it "stringifies simple POROs" do
      simple_data_structure = { a_key: %w(some values) }
      expect(simple_data_structure).to match_snapshot("simple_data_structure")
    end
  end

  it "support custom serializer" do
    hash = "<html><head><title>Hello</title></head><body><h1>world</h1></body></html>"
    expect(hash).to match_snapshot("custom_serializer", { serializer: HtmlSerializer })
  end
end
