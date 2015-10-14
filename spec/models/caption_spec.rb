require 'rails_helper'

describe Caption do
  it {should validate_presence_of :text}


  it { should belong_to :user}
  it { should belong_to :captionable}
  it { should have_many :captions}
end
