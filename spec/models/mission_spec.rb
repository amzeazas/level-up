require 'rails_helper'

describe Mission do
  it { should validate_presence_of :description }
  it { should belong_to :quest }
end
