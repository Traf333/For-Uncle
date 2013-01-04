require 'spec_helper'

describe "operations/show" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :value => "Value",
      :coment => "MyText",
      :client => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
