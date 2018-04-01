module Sm2
  class Fact
    MAX_GRADE = 5
    # D_EF[q] = (0.1 - (MAX_GRADE - grade) * (0.08 + (MAX_GRADE - grade) * 0.02))
    D_EF = {
      5 => 0.1,
      4 =>  0,
      3 => -0.14,
      2 => -0.32,
      1 => -0.54,
      0 => -0.8
    }.freeze

    attr_reader :interval, :easiness_factor, :repetition

    def initialize(easiness_factor: nil, repetition: nil, interval: nil)
      @easiness_factor = easiness_factor || 2.5
      @repetition = repetition || 0
      @interval = interval
    end

    def next_interval(grade)
      grade = MAX_GRADE if grade > MAX_GRADE

      if grade >= 3
        if repetition == 0
          @interval = 1
          @repetition = 1
        elsif repetition == 1
          @interval = 6
          @repetition = 2
        else
          @interval = (interval * easiness_factor).round
          @repetition = repetition + 1
        end
      else
        @repetition = 0
        @interval = 1
      end

      @easiness_factor = (easiness_factor + D_EF[grade]).round(2)
      @easiness_factor = easiness_factor < 1.3 ? 1.3 : easiness_factor

      return interval
    end
  end
end
