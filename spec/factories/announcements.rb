# == Schema Information
# Schema version: 20220322100510
#
# Table name: announcements
#
#  id         :bigint           not null, primary key
#  visibility :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  content    :text
#

FactoryBot.define do
  factory :announcement do
    user
    visibility { 'everyone' }
    title { 'Introducing projects' }
    content { 'We’re delighted to announce we’ve rolled out the new projects' }

    transient do
      dismissed_by { nil }
    end

    after(:create) do |announcement, evaluator|
      [evaluator.dismissed_by].flatten.compact.each do |user|
        announcement.dismissals.create(user: user)
      end
    end
  end
end
