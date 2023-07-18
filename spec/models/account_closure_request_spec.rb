# == Schema Information
# Schema version: 20230718062820
#
# Table name: account_closure_requests
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe AccountClosureRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
