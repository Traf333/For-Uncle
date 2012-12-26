require 'spec_helper'

describe Client do
  
  before { @client = Client.new(name: "Example User", email: "user@example.com") }

  subject { @client }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
end
