require 'spec_helper'

describe "operations/new" do
  before(:each) do
    assign(:operation, stub_model(Operation,
      :value => "MyString",
      :coment => "MyText",
      :client => nil
    ).as_new_record)
  end

  it "renders new operation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => operations_path, :method => "post" do
      assert_select "input#operation_value", :name => "operation[value]"
      assert_select "textarea#operation_coment", :name => "operation[coment]"
      assert_select "input#operation_client", :name => "operation[client]"
    end
  end
end
