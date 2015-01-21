To see which version of Ruby you are using, type:

	$ rvm current

If you have installed more than one Ruby or are working with more than one Gemfile (i.e., if you have another project on your machine), or if you're experiencing any "dependency hell" with Ruby or your Gems, then you will be well-served by using RVM's "gemsets" feature and project files:

	$ cd METRORails2015
	$ rvm use 2.1
	$ rvm gemset create metro-rails
	$ rvm gemset use metro-rails
	$ bundle install
	$ echo "2.1" > .ruby-version
	$ echo "metro-rails" > .ruby-gemset
	
You can test that everyhing is in order:

	$ cd ../
	$ rvm use system
	$ ruby -v

You should see that you are using Ruby 2.0 or lower. Now go back to the project directory:

	$ cd METRORails2015
	$ ruby -v
	
You should see that you are using Ruby 2.1.x




