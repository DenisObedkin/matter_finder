require 'rails_helper'

RSpec.describe Matters::Search do
  subject(:call) { described_class.new(params, autocomplete).() }

  let(:params) { {} }
  let(:autocomplete) { false }

  let!(:matter_1) { create :matter }
  let!(:matter_2) { create :matter, title: 'New title', text: 'New text' }

  describe 'find for matters' do
    context 'without params' do
      it 'should be both matters' do
        expect(subject).to include(matter_1)
        expect(subject).to include(matter_2)
      end
    end

    context 'with params' do
      let(:params) { { title: 'new' } }
      let(:autocomplete) { true }

      before do
        Matter.reindex
      end

      it 'should be only exact number' do
        expect(subject).not_to include(matter_1)
        expect(subject).to include(matter_2)
      end
    end
  end
end