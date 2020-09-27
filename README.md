# PageViews

Parses and takes some metrics of a `.log` file of page names and visitor IPs.

## Usage

run `rake page_views:run` with a file path as the argument, like so:
```
rake page_views:run["path/to/my/file.log"]
```
For a sample file, please check [this sample file][sample_file].

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## CHANGELOG

[Changes][changelog]

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thalesmiguel/page-views.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[changelog]: CHANGELOG.md
[sample_file]: spec/fixtures/files/sample.log
