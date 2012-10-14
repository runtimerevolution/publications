
Publications
====

[Publications](http://github.com/karma/publications) is a library for Rails, enabling you to easily add publication control to your models. You can control publication based on activation and deactivation dates, a boolean flag, or a combination of both.

The project includes helpers for a few CRUD runtime generators (such as ActiveAdmin, ActiveScaffold)


Installation
---

Just add this to your Gemfile:

gem "publications"

(you can also install the gem directly with: gem install publications)

Overview
---

After Publications is installed, it's easy to add publication support to your models. Just add this to your class:

	name_of_method

Example:

	class Book
		name_of_method	# This is all it takes :)
	end
	
You'll be able to do the following:

	book = Book.new
	book.active = true
	book.save!
	
	Book.active # will return all active books 
	
	Book.find_all # will return only published books, if creation of a global scope has been enabled

Migrations
---

A few columns will be needed in your tables to handle publications. To add them, just add the following to your migrations (either on create_table or change_table):

	t.publications
	
Example
	
	class AddPublicationsToBooks < ActiveRecord::Migration
	  def self.up
	    create_table :books do |t|
	      t.publications
	    end
	  end

	  def self.down
		drop_table :books
	  end
	end
	
Configuration
---
The following options allow you to configure Publications to fit your needs:

	:default_scope 	Configures wether a default scope is created that only returns published objects (default = false)




GUI support
---

The project includes helpers for a few CRUD runtime generators (such as ActiveAdmin, ActiveScaffold).



* Suporte integrado para ActiveAdmin
* Testes
* Migrações down
* Indices

----

* Suporte para controlar para quem se publica (uso mais avançado)
* Default scopes
