# == Schema Information
# Schema version: 20220322100510
#
# Table name: request_summary_categories
#
#  id         :bigint           not null, primary key
#  slug       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :request_summary_category, :class => 'AlaveteliPro::RequestSummaryCategory',
                                     :aliases => [:waiting_response_request_summary_category] do
    slug { 'waiting_response' }
  end
end
