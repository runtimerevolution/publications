Publications
====

[Publications](http://github.com/runtimerevolution/publications) is a library for Rails, enabling you to easily add publication control to your models. You can control publication based on activation and deactivation dates, a boolean flag, or a combination of both.

Support is included for CRUD runtime generators (such as ActiveAdmin, ActiveScaffold)

Installation
---

Just add this to your Gemfile:
```ruby
gem "publications"
```
(you can also install the gem directly with: gem install publications)

Overview
---

After Publications is installed, it's easy to add publication support to your models. Just add this to your class:
```ruby
	has_publish_control
```
Example:
```ruby
	class Book
	  has_publish_control	# This is all it takes :)
	end
```	
You'll be able to do the following:
```ruby
	book = Book.new
	book.active = true
	book.activated_at = 10.days.from_now
	book.disabled_at = 20.days.from_now
	book.save!
	
	Book.active # will return all active books 
	
	Book.all # will return only published books, if creation of a global scope has been enabled
```
Migrations
---

A few columns will be needed in your tables to handle publications. To add them, just add the following to your migrations (either on createtable or changetable):
```ruby
	t.publications
```	
Example
```	
	class AddPublicationsToBooks < ActiveRecord::Migration
	  def self.up
	    create_table :books do |t|
	      t.publications
	    end
	  end

	  def self.down
		#TODO
	  end
	end
```	
Configuration
---
The following options allow you to configure Publications to fit your needs:

 	:default_scope Configures wether a default scope is created that only returns published objects (default = false)


GUI support
---

The project includes helpers for a few CRUD runtime generators (such as ActiveAdmin, ActiveScaffold).

To use with ActiveAdmin, include the following in your form configuration:

```ruby
    f.inputs "Publication" do
      f.publications  
    end
```
To use with ActiveScaffold, include the following in your form configuration:

	TBD


Roadmap / TODO 
---

Significant improvements

* Support for publication workflow (aprovals)
* Support for other conditions besides dates and boolean flag
* Support for configurable publishing conditions
* Support for users and groups (publish for just a given set of people)
* Integration with fine-grained access control framework


Small improvements

* Add ActiveScaffold support (and eventually RailsAdmin)
* Add more tests
* Implement down migrations
* Add indexes
* Default scopes
* More configuration options

----

