require 'sm2/fact'

RSpec.describe Sm2::Fact do
  subject { Sm2::Fact.new }

  describe '.initialize' do
    it 'sets initial values' do
      expect(subject.easiness_factor).to eq 2.5
      expect(subject.repetition).to eq 0
    end
  end

  describe 'next_interval' do
    context 'when grade is 5' do
      context 'and repetition is 0' do
        before { subject.next_interval(5) }

        it 'sets interval to 1' do
          expect(subject.interval).to eq 1
        end

        it 'sets repetition to 1' do
          expect(subject.repetition).to eq 1
        end

        it 'sets easiness_factor to 2.6' do
          expect(subject.easiness_factor).to eq 2.6
        end
      end

      context 'and repetition is 1' do
        before do
          subject.next_interval(5)
          subject.next_interval(5)
        end

        it 'sets interval to 6' do
          expect(subject.interval).to eq 6
        end

        it 'sets repetition to 2' do
          expect(subject.repetition).to eq 2
        end

        it 'sets easiness_factor to 2.7' do
          expect(subject.easiness_factor).to eq 2.7
        end
      end

      context 'and repetition is 2' do
        before do
          subject.next_interval(5)
          subject.next_interval(5)
          subject.next_interval(5)
        end

        it 'sets interval to 16' do
          expect(subject.interval).to eq 16
        end

        it 'sets repetition to 3' do
          expect(subject.repetition).to eq 3
        end

        it 'sets easiness_factor to 2.8' do
          expect(subject.easiness_factor).to eq 2.8
        end
      end
    end

    context 'when grade is 4' do
      context 'and repetition is 0' do
        before { subject.next_interval(4) }

        it 'sets interval to 1' do
          expect(subject.interval).to eq 1
        end

        it 'sets repetition to 1' do
          expect(subject.repetition).to eq 1
        end

        it 'sets easiness_factor to 2.5' do
          expect(subject.easiness_factor).to eq 2.5
        end
      end

      context 'and repetition is 1' do
        before do
          subject.next_interval(4)
          subject.next_interval(4)
        end

        it 'sets interval to 6' do
          expect(subject.interval).to eq 6
        end

        it 'sets repetition to 2' do
          expect(subject.repetition).to eq 2
        end

        it 'sets easiness_factor to 2.5' do
          expect(subject.easiness_factor).to eq 2.5
        end
      end

      context 'and repetition is 2' do
        before do
          subject.next_interval(4)
          subject.next_interval(4)
          subject.next_interval(4)
        end

        it 'sets interval to 15' do
          expect(subject.interval).to eq 15
        end

        it 'sets repetition to 3' do
          expect(subject.repetition).to eq 3
        end

        it 'sets easiness_factor to 2.5' do
          expect(subject.easiness_factor).to eq 2.5
        end
      end
    end

    context 'when grade is 3' do

    end

    context 'when grade is 2' do

    end

    context 'when grade is 1' do

    end

    context 'when grade is 0' do

    end
  end
end
