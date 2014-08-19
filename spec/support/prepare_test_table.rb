DB = Sequel.sqlite

DB.create_table :tests do
  primary_key :id
  String :name
  Integer :price
end
