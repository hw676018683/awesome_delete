ActiveRecord::Schema.define(:version => 0) do
  create_table :projects, :force => true do |t|
    t.string :title
    t.integer :forms_count
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :forms, :force => true do |t|
    t.string :title
    t.integer :formable_id
    t.string :formable_type
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :responses, :force => true do |t|
    t.integer :responseable_id
    t.string :responseable_type
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :fields, :force => true do |t|
    t.string :title
    t.integer :form_id
    t.string :type
    t.integer :options_count, default: 0
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :options, :force => true do |t|
    t.string :title
    t.integer :field_id
    t.datetime :created_at
    t.datetime :updated_at
  end

  create_table :entries, :force => true do |t|
    t.string :title
    t.integer :response_id
    t.datetime :created_at
    t.datetime :updated_at
  end
end