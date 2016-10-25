require 'json-schema'

module Minitest::Assertions
  def assert_json_schema(schema, json)
    schema_path = File.join(Dir.pwd, 'test', 'support', 'json_schemas', "#{schema}.json")

    assert JSON::Validator.validate(schema_path, JSON.parse(json))
  end
end
