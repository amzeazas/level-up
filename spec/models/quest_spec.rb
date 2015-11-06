require 'rails_helper'

describe Quest do
  it { should validate_presence_of :title }
  it { should belong_to :user }
  it { should have_many :missions }
end
