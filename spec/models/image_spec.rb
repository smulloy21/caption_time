require 'rails_helper'

describe Image do
  it { should validate_presence_of :img}

  it { should belong_to :user }
  it { should have_many :captions }

end
