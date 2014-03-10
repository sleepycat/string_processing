# StringProcessing

This is a tiny little gem that tries to add a little structure in
moments where you are doing extensive text transformations.

Ruby has amazing string processing abilities built in but in
circumstances were many transformations are required its common to see
long chains of gsubs/splits/joins.

The goal here is to avoid that an replace it with something a little
more readable and structured.

## Installation

Add this line to your application's Gemfile:

    gem 'string_processing'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install string_processing

## Usage

To use StringProcessing you first define a pipeline by calling
Pipeline.define.
This will return a class which will do the processing when you call the
process method.

```ruby
FooPipeline = StringProcessing::Pipeline.define do
  using proc{|x| x.map{|n| n.split('/')} }
  using proc{|x| x.map(&:downcase) }
end

FooPipeline.process "HTML/CSS"
=> ["html", "css"]
```
The processing pipeline can consist of anything that responds to #call
and both accepts and returns an array.

## Contributing

1. Fork it ( http://github.com/sleepycat/string_processing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
