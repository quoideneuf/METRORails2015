### Database
Once again, use the Rails generator tool to generate a scaffold, in this case a migration:

	rails g migration AddImpressionsTable
	
In your editor, open the new file in the _db/migrate_ directory.

Replace the change method with:

	def change
      create_table :impressions do |t|
        t.integer :hits
      end
  	end
  	
and run the Rake task to update your database:

	$ rake db:migrate
	
Now to hook the model to the table, open _app/models/impression.rb_ and edit it to look like this:

```
class Impression < ActiveRecord::Base
  self.table_name = "impressions"

  def self.hit
    record = self.first	|| self.new(:hits => 0)
    record.hits += 1
    record.save
  end

  def self.total
    self.first.hits
  end
end
```

Now try reloading your app a few times, restarting it, and reloading again.

### Tests
We are going to need to refactor our Impression model at some point - it just isn't very robust. But we don't want to break our app, so we need a test before we refactor.

Run the scaffolded test using Rake:

	$ rake test
	
You should see a lot of zeros. Let's change that.

Open _test/models/impression_test.rb_ and add the following at line 4:

```
  test "bad logic" do
    assert true == false
  end
  ```		

Then run the tests again. You should see 1 failure.

Ok, now write the test for real:

```
  test "hit counting" do
    5.times { Impression.hit }
    assert Impression.total == 5
  end
  ```
Then run the tests again. Now you can refactor with confidence.

### Better Record Keeping

This app is pretty awesome, but it could be better. What if we could track the time of each visit?

To do that, we'll need something more than a number. By adding a new test to _test/models/impression_test.rb_ we can 'sketch' the kind of interface we'd like for our Impression model:

```
  test "time tracking" do
    Impression.hit
    sleep 1
    Impression.hit

    assert Impression.first.time < Impression.second.time
  end
  ```
We can confirm that this test fails, then start working on a solution. First of all, we need to add a `time` column to the database. Open the migration file in _db/migrate_ and add a second column:

	t.datetime

Now rollback the database and run the migration again:

	$ db:rollback
	$ db:migrate
	
This also has to be done for the test database:

	$ RAILS_ENV=test db:rollback
	$ RAILS_ENV=test db:migrate

In _app/models/impression.rb_, now add a timestamp to the line that creates the Impression record:

	record = self.first || self.new(:hits => 0, :time => Time.now)
	
The test is still failing, but not for the same reason. The problem now is that `Impression.second` doesn't exist. We need to change the model so that it creates one record to represent *each* impression rather than one record to represent *all* impressions:

```
  def self.hit
    record = self.new(:time => Time.now)
    record.save
  end

  def self.total
    self.count
  end
  ```
 
Perhaps the next logical step would be to add a statement to the home page that tells the user when the last hit was...or how often the app receives a hit. 

Hint: You'll probably need to learn a bit about [Ruby's Time API](http://ruby-doc.org/core-2.1.5/Time.html) to do this. If you want to experiment, try using the rails console:

	$ rails c
	> Time.now.hour
  
	










