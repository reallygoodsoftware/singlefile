# One File. Batteries Included. No Build Steps

SingleFile lets you build and serve beautiful, fast web apps from a single file.

**Add a route**

```ruby
get '/' do
  erb 'home'
end
```

**Start the server**

```ruby
ruby singlefile.rb
```

<br/>

# Everything you need. Nothing you don't

**What you don't need to build beautiful, fast web apps:** A heavy framework or meta framework. Knowledge of complicated, esoteric framework-dependent patterns. Lots of javascript. A build step.

**What you need to build beautiful, fast web apps:** Design defaults and consistency for common frontend UI elements. Established patterns for keeping a handle on your CSS, patterns for simple and complex frontend interactivity, a way to interact with your database (optional), a simple way to handle routing & templating.

### What SingleFile gives you:

- A full design system for common UI patterns - buttons, forms, tabs, modals, drawers, tooltips, accordions etc. Based on the web platform. [Read More](https://base-styles.com/) about Base Styles.
- Tailwind Layout classes (via [Litewind](https://litewindcss.com/)). 
- The simplicity of a server rendered approach (just write html), with the feel of an SPA, with almost no additional code to write. 
- A simple pattern for lightweight frontend interactivity, and full blown interactive components. [Read More](https://mini-js.com/) about Mini Js. 
- A simple way to handle routing, templating, and other server-rendered utilities. 


<br/>

# Principles

- **HTML First**: We leverage what the web platform is capable of, adding minor enhancements that extend existing patterns instead of creating an entirely new language on top of it (cough React).
- **Portable**: Lack of build step & no platform dependencies make hosting on any platform or running locally completely painless.
- **Readable**: No need to piece together context from dozens of files or bundled libraries. Easily digestable by both humans & LLMs.
- **LLM Friendly** - Simple syntax. Few moving parts. Low file count. Comprehensive copy-paste-able documentation. No Build Step Complexity.
- **View Source Friendly** We embrace locality of behaviour and only add libraries that don't hide their behaviour several layers deep. Once you learn a few simple patterns, you won't have to go diving through external docs sites and Github repos to figure out what's happening.
- **No Experience Necessary** - A smart developer with zero pre-existing knowledge can become proficient enough to read and write our patterns in an hour. 
- **Low Floor, High Ceiling**: Build a simple web page with html and some tailwind, make it interactive with mini attributes, or level up and build components.
- **Designed For Codebase Longevity**: Zero frontend dependencies. Minimal backend dependencies. Designed to be still be modifiable in 20 years.  


<br/>

# The Single File Philosophy 

Ok - so we've taken some liberties with the term "Single File" - the full repository does in fact contain more than one file. What we're actually aiming for is...

- **Application**: A single file that outlines all routes and backend behaviour (singlefile.rb).
- **Documentation**: A single file that covers all patterns (With inline slide-outs where necessary).
- **Layout**: A single file to understand all additions beyond basic html. 


<br/>


# Setup

You will need ruby installed on your system. If you don't already have it, we recommend using [rbenv](https://github.com/rbenv/rbenv) for this.

```
brew install rbenv
rbenv install 3.2.0
```

With ruby 3.2.0 installed, start the server with:

```
ruby singlefile.rb
```

<div class="hide-on-website">

# Documentation

https://docs.single-file.dev

</div>