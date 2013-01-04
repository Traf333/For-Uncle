require 'spec_helper'

describe "operations/edit" do
  before(:each) do
    @operation = assign(:operation, stub_model(Operation,
      :value => "MyString",
      :coment => "MyText",
      :client => nil
    ))
  end

  it "renders the edit operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operations_path(@operation), :method => "post" do
      assert_select "input#operation_value", :name => "operation[value]"
      assert_select "textarea#operation_coment", :name => "operation[coment]"
      assert_select "input#operation_client", :name => "operation[client]"
    end
  end
end
