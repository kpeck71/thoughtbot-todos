RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation) # before the test suite runs, we'll truncate the db = anything that's present in the db at the beginning of the test suite will be cleaned out
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    # before normals tests, everything that's not JS,
    # everything will be run within a transaction; create the data, then rollback the transaction
    # quicker than if we create the data and then have to truncate the db
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
    # before every JS, truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    # clean out DB
  end

end
