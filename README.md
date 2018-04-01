This is a Ruby implementation of the [SuperMemo 2](https://www.supermemo.com/english/ol/sm2source.htm) algorithm.

## Install
```
gem install sm2_rb
```

Or add it to your Gemfile
```
gem 'sm2_rb', '~> 0.0.1'
```

## Usage

Create a new fact and call `.next_interval`, passing the grade to the method. Valid grades are 0-5, where 0 is it was really hard to answer, and 5 is it was very easy to answer. Returns the interval where it should be shown next.

```ruby
fact = Sm2::Fact.new
fact.next_interval(5) => 1
```

The `fact` keeps track of what repetition it's on, along with its easiness factor and current interval. If you have a fact with these three attributes stored, you can initialize with these values:

```ruby
fact = Sm2::Fact.new(
  easiness_factor: 2.6,
  repetition: 2,
  interval: 6
)
```
