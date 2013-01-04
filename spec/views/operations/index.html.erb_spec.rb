require 'spec_helper'

describe "operations/index" do
  before(:each) do
    assign(:operations, [
      stub_model(Operation,
        :value => "Value",
        :coment => "MyText",
        :client => nil
      ),
      stub_model(Operation,
        :value => "Value",
        :coment => "MyText",
        :client => nil
      )
    ])
  end

  it "renders a list of operations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
