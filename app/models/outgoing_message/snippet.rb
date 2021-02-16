##
# Predefined helpful text snippets which can added to outgoing messages
#
class OutgoingMessage::Snippet < ApplicationRecord
  include Taggable

  translates :name, :body
  include Translatable # include after call to translates

  validates :name, :body, presence: true
end
