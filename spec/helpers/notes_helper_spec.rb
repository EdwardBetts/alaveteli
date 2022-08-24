require 'spec_helper'

RSpec.describe NotesHelper do
  include NotesHelper

  describe '#notes_allowed_tags' do
    it 'returns the list of allowed tags' do
      allowed_tags = %w(strong em b i p code pre tt samp kbd var sub sup dfn
                        cite big small address hr br div span h1 h2 h3 h4 h5 h6
                        ul ol li dl dt dd abbr acronym a img blockquote del ins
                        table tr td th u time font iframe)
      expect(notes_allowed_tags).to include(*allowed_tags)
    end
  end

  describe '#batch_notes_allowed_tags' do
    it 'returns the list of allowed tags' do
      allowed_tags = %w(strong em b i p code tt samp kbd var sub sup dfn cite
                        big small address hr br div span ul ol li dl dt dd abbr
                        acronym a del ins table tr td th u time)
      expect(batch_notes_allowed_tags).to include(*allowed_tags)
    end
  end
end
