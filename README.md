## Overview
In this workshop we will work on building a basic Ruby on Rails app that we can run on our laptops using the built-in Rails development webserver. Some of the topic we'll attempt to cover in this workshop are:

* managing Ruby Gems using Bundler
* the Rake automation tool
* the Rails routing system
* ActiveRecord, the Rails database abstraction layer
* models, views and controllers
* the Rails asset pipeline
* writing and running unit tests
* composing models using behaviors / mixins


## 0. Prerequisites
The main requirement is that your laptop will need to have Ruby 2.1 installed. However, installing ruby may require several steps, depending on your machine and the state it's in when you begin. It is recommended that you follow the [RailsBridge Installfest](http://installfest.railsbridge.org/installfest/installfest) guidelines ahead of time. You can ignore the parts about Heroku and, though it is recommended that you install and learn the basics of Git, Git is not required. You can stop when you reach the "Create a Rails App" section. 

You should expect to spend an hour going through the Installfest process. [Email me](brianjhoffman@gmail.com) ahead of time or arrive early if you are having problems working through the installfest process.

### Required
* A plain text editor
* Basic familiarity with the command line (Unix/Mac or Windows)
* Ruby 2.1 installed

### Recommended
* RVM (for managing your Ruby installation)
* the git command-line tool
* a Github account
* Mac users: [iTerm](http://iterm2.com/) instead of Terminal


## 1. Setup
If you've made it this far and are still feeling ambitious, you can follow the steps in this section on your own to complete the bandwidth-heavy portion of the setup. If not, we will walk through these steps before and / or during the first half hour of the workshop.

### Getting the project

In your Terminal / Command Prompt navigate to a directory you wish to use for development. For example, on my Mac I like to do my development in a "Projects" folder in my home directory, so when I open Terminal I type:

    $ cd ~/Projects
    
If you are using git, now is the time to "clone" this repository:

    $ git clone https://github.com/quoideneuf/METRORails2015
    
If you aren't useing git, you can just download the project [here](https://github.com/quoideneuf/METRORails2015/releases).

Now you should be able to see this README when you change directories and list contents, like so:

    $ cd METRORails2015
	$ ls

If you are using git, you can also make sure you have the latest version of the repository by doing this:

	$ git pull	

Now we're ready to start installing dependencies using RubyGems and Bundler.

### RubyGems and Bundler

If you are using RVM, make sure you're using the right version of Ruby:

	$ rvm current
	
You should see 'ruby 2.1.x' (where 'x' is 5 or higher). If you don't, try this:

	$ rvm use 2.1

If that fails, you need to install 2.1:

	$ rvm install 2.1

Next you need to get the latest version of RubyGems (2.4.5 or higher). To see your version:   
    
	$ gem --version

and to upgrade (using RVM):

	$ rvm rubygems latest

Next install bundler:

	$ gem install bundler

Next install the project's gemset:

	$ bundle install
	
Review your installed gems:

	$ gem list
	
Turn off Bundler's 'binstubs' per Rails 4's requirement

	$ bundle config --delete bin
	
To sum up, we used RVM to install Ruby 2.1 and RubyGems, the Ruby package manager. We then used RubyGems to install Bundler, a project-level package manager. We then used Bundler to install our project's dependencies (Rails, etc.).

### The Rails CLI

Have a look at the Rails command-line interface (CLI):

	$ rails -v

This should tell you that you're using Rails version 4.2.0 (or higher).

To see the help page for the Rails CLI:

	$ rails

If you have made it this far ahead of the workshop that is great, and you can stop now.

## 2. Building our app
	
Now we'll go ahead and use the CLI to setup a new Rails project:

	$ mkdir myapp
	$ rails new myapp
	$ ls myapp

### The Rails development server

When you are developing a Rails app, you probably want to see what it looks like. Fortunately, Rails gives you and easy way to do this:

	$ cd myapp
	$ rails -s

Now open up your favorite browser and navigate to <http://localhost:3000>.

Do you see the Rails logo and "Welcome Aboard" message?





  


