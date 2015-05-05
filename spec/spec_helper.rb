require("rspec")
require("pg")
require("cafe")
require("food")

DB = PG.connect({:dbname => 'test_cafe'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cafe *;")
    DB.exec("DELETE FROM food *;")
  end
end
