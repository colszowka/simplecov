v0.5.0 (2011-09-09)
===================

  * JSON is now used instead of YAML for resultset caching (used for merging). Should resolve
    a lot of problems people used to have because of YAML parser errors.

  * There's a new adapter 'test_frameworks'. Use it outside of Rails to remove `test/`,
    `spec/`, `features/` and `autotest/` dirs from your coverage reports, either directly
    with `SimpleCov.start 'test_frameworks'` or with `SimpleCov.load_adapter 'test_frameworks'`

  * SimpleCov configuration can now be placed centrally in a text file `.simplecov`, which will
    be automatically read on `require 'simplecov'`. This makes using custom configuration like
    groups and filters across your test suites much easier as you only have to specify your config
    once. Just put the whole `SimpleCov.start (...)` code into `APP_ROOT/.simplecov`

  * Lines can now be skipped by using the :nocov: flag in comments that wrap the code that should be
    skipped, like in this example (thanks @phillipkoebbe)

    <pre>
      #:nocov:
      def skipped
    	  @foo * 2
      end
      #:nocov:
    </pre>

  * Moved file set coverage analytics from simplecov-html to SimpleCov::FileList, a new subclass
    of Array that is always returned for SourceFile lists (i.e. in groups) and can now be used
    in all formatters without the need to roll your own.

  * The exceptions you used to get after removing some code and re-running your tests because SimpleCov
    couldn't find the cached source lines should be resolved (thanks @goneflyin)

  * Coverage strength metric: Average hits/line per source file and result group (thanks @trans)

  * Finally, SimpleCov has an extensive Cucumber test suite

  * Full compatibility with Ruby 1.9.3.preview1

HTML Formatter:
---------------

  * The display of source files has been improved a lot. Weird scrolling trouble, out-of-scope line hit counts
    and such should be a thing of the past. Also, it is prettier now.
  * Source files are now syntax highlighted
  * File paths no longer have that annoying './' in front of them
