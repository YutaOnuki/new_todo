require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validates' do
    subject { Task.new(name: test_name) }

    describe 'name' do
      context '値が入っているとき' do
        let(:test_name) { "test" }
        it 'バリデーションを通ること' do
          is_expected.to be_valid
        end
      end

      context '値が入っていないとき' do
        let(:test_name) { nil }
        it 'バリデーションに掛かること' do
          is_expected.to be_invalid
        end
      end
    end
  end
end
