# awesome_delete
> Recursive delete appropriately

Delete a collection with less sqls. 
It thinks about the following
- STI (delete the associations of subclass)
- polymorphism
- counter_cache, touch (avoid to unnecessary handle)
- callbacks

## Example

```ruby
class Form < ActiveRecord::Base
  has_many :fields, dependent: :destroy
end

class Field < ActiveRecord::Base
end

Form.delete_collection [1,4,5]
```
The class method `execute_callbacks` will execute callbacks.
Overwriting it maybe a better choice.
eg:
```ruby
class CloudFile < ActiveRecord::Base
  after_destroy :remove_file
  
  def self.execute_callbacks ids
    keys = where(id: ids).pluck(:key)
  end
  
  def remove_file key
    HttpClient.send_request key
  end
end
```