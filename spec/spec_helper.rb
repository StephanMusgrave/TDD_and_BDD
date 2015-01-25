RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

# http://www.relishapp.com/rspec/rspec-expectations/docs/syntax-configuration
# The primary syntax provided by rspec-expectations is based on
# the expect method, which explicitly wraps an object or block
# of code in order to set an expectation on it.

# There's also an older should-based syntax, which relies upon should being
# monkey-patched onto every object in the system.However, this syntax can at times lead to
# some surprising failures, since RSpec does not own every object in the system and cannot
# guarantee that it will always work consistently.

# We recommend you use the expect syntax unless you have a specific reason you prefer the
# should syntax. We have no plans to ever completely remove the should syntax but starting
# in RSpec 3, a deprecation warning will be issued if you do not explicitly enable it, with the
# plan to disable it by default in RSpec 4 (and potentially move it into an external gem).

# If you have an old should-based project that you would like to upgrade to the expect,
# check out transpec, which can perform the conversion automatically for you.
