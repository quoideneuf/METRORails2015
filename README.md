## Overview
In this workshop we will work on building a basic Ruby on Rails app that we can run on our laptops using the built-in Rails development webserver. Some of the topic we'll cover in this workshop are:

* managing Ruby Gems using Bundler
* the Rake automation tool
* the Rails routing system
* ActiveRecord, the Rails database abstraction layer
* Models, views and controllers
* Writing and running a unit test


## Requirements / Setup
The main requirement is that your laptop will need to have Ruby 2.1 installed. However, installing ruby may require several steps, depending on your machine and the state it's in when you begin. It is recommended that you follow the [RailsBridge Installfest](http://installfest.railsbridge.org/installfest/installfest) guidelines ahead of time. You can ignore the parts about Heroku and, though it is recommended that you install and learn the basics of Git, Git is not required. You can stop when you reach the "Create a Rails App" section. 

You should expect to spend an hour going through the Installfest process.

### Required
* A plain text editor
* Basic familiarity with the command line (Unix/Mac or Windows)
* Ruby 2.1 installed

### Recommended
* RVM (for managing your Ruby installation)
* the git command-line tool
* a Github account
* Mac users: [iTerm](http://iterm2.com/) instead of Terminal


## Getting Started

### Getting the project

In your Terminal / Command Prompt navigate to a directory you wish to use for development. For example, on my Mac I like to do my development in a "Projects" folder in my home directory, so for me this like:

    $ cd ~/Projects
    
If you are using git, now is the time to "clone" this repository:

    $ git clone https://github.com/quoideneuf/METRORails2015
    
If you aren't useing git, you can just download the project [here](https://github.com/quoideneuf/METRORails2015/releases).

Now you should be able to see this README when you change directories and list contents, like so:

    $ cd METRORails2015
	$ ls

Now we're ready to start installing dependencies using RubyGems and Bundler

## RubyGems and Bundler

Get the latest version of RubyGems (2.4.5 or higher). To see your version:   
    
	$ gem --version

Install bundler:

	$ gem install bundler
	
Discussion: RubyGems and Bundler Overview.

Review the Gemfile

Install the project's gemset:

	$ bundle install
	
Review your installed gems:

	$ gem list




  


