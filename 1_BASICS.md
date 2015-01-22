## Rails Basics

###  Basic Rake

See the Rake tasks that come with Rails:

	$ cd myapp
	$ rake -T
	
Run a simple Rake task:

	$ rake about

Use the rails command line to generate a custom task:

	$ rails g task metro task1

Now when you run 'rake -T' you'll see "metro:task1" on the menu. 

Open _lib/tasks/metro.rake_ in your text editor. At line 4, insert `puts "hello"` and hit return.

Now save the file and run the task and be said hello to:

	$ rake metro:hello

### Rails Routing

Open _config/routes.rb_ in your text editor.

Insert the following at line 2:

	root 'home#index'

Now point your browser to <http://localhost:3000>. 

### Controllers

Unbreak your app by creating a controller. 

Visit <http://localhost:3000> to see...your new error.

Open _app/controllers/home_controller.rb_ in your editor.

At line 2, insert the following:

	def index
      render :json => {:time => Time.now}
  	end

and reload <http://localhost:3000>.

### Views

Time to get serious and add some HTML.

	$ touch app/views/home/index.html.erb
	
Now open that file in your text editor and insert the following:

	<h2>HELLO</h2>

Open _app/controllers/home_controller.rb_ in your editor and comment out line 4 by prepending a '#' character:

	# render :json => {:time => Time.now}
	
Now reload <http://localhost:3000>.

That's great, but your app doesn't tell time anymore - let's fix that. 

Open up _app/controllers/home_controller.rb_ again and uncomment line 4, then edit it to look like this:

	@data = {:time => Time.now}

Open _app/views/home/index.html.erb_ and add this line:

	<p>It's <%= @data[:time] %></p>

### Models

Let's start keeping track of hits to our app, using a model:

	$ rails g model impression --migration=false
	
Open _app/models/impression.rb_ in your editor and insert the following at line 2:

	@@hits ||= 0
	
	def self.hit
      @@hits += 1
  	end
  	
  	def self.total
      @@hits
  	end

Now open your controller (_app/controllers/home_controller.rb_) and modify the body of the `index` method like the following:

	Impression.hit
	
	@data = {:time => Time.now, :hits => Impression.total}
	
Finally, update your view with another `<p>`:

	<p>This app has received <%= @data[:hits] %> hits
	
Now reload <http://localhost:3000>. Reload again to get your hit count up. Now you're ready for your first funding round.
	





	
