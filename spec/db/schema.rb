ActiveRecord::Schema.define(version: 0) do
  create_table 'users', force: true do |t|    
    t.string 'type'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'username'
    t.string 'email'
  end
end