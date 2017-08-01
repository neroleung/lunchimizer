require 'rails_helper'

describe Lunch::Grouper do
  describe '#run' do
    subject { described_class.new(user_names).run }

    let(:user_names) { user_count.times.map { Faker::Name.name } }
    let(:options) { {} }

    ((described_class::DEFAULT_MIN * 2)..50).each do |n|
      let(:user_count) { n }

      it "returns users in groups (user_count: #{n})" do
        expect(subject.flatten).to match_array(user_names)

        subject.each do |group|
          expect(group).to be_an(Array)
          expect(group.count).to be >= described_class::DEFAULT_MIN
          expect(group.count).to be <= described_class::DEFAULT_MAX
        end
      end
    end

    context 'when given user_names are fewer than minimum * 2' do
      let(:user_count) { (described_class::DEFAULT_MIN * 2) - 1 }

      it 'raises' do
        error_message = "Requires at least #{described_class::DEFAULT_MIN * 2} users. Please add more users."

        expect { subject }.to raise_error(described_class::NotEnoughUsersError, error_message)
      end
    end

    context 'ensure randomness' do
      let(:user_count) { described_class::DEFAULT_MIN * 2 }

      it 'always shuffles' do
        expect(subject).to_not eq(described_class.new(user_names).run)
      end
    end
  end
end
