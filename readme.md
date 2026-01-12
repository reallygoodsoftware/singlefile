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

**What you need to build beautiful, fast web apps:**

- Design defaults and consistency for common frontend UI elements.
- Established patterns for keeping a handle on your CSS.
- Established patterns for simple and complex frontend interactivity.
- A way to interact with your database (optional).
- A simple way to handle routing & templating.

**What you don't need to build beautiful, fast web apps**

- A heavy framework or meta framework
- Knowledge of complicated, esoteric framework-dependent patterns 
- Lots of javascript
- A build step 

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

We've taken some liberties with our definition. What we're aiming for is:

- **Application**: A single file that outlines all routes and backend behaviour (singlefile.rb).
- **Documentation**: A single file that covers all patterns (With inline slide-outs where necessary).
- **Layout**: A single file to understand all additions beyond basic html. 


<br/>

# Basics

**Make It Yours** 

- Add your `favicon.ico` in the `/assets/icons` folder
- Update the site metadata in `/helpers.rb`
- Modify the 4 core CSS defaults in `styles.css`

```css
:root {
  --ui-font-family: 
  --ui-font-family-headings:
}
```


**Add a new route**

Create a new file at `/views/home.erb` then add a route for it.

```ruby
get '/' do
  erb 'home'
end
```



**Add A Link**

```html
<a href="/about">About</a>
```

**Include a partial**

```html
<%= erb :"partials/_sidebar" %>
```

**Styling With Tailwind**

Use any of the 50,000+ Tailwind classes available through Litewind. We recommend using Tailwind primarily for layout. 

```html
<div class="flex justify-center">
</div>
```

**Styling Forms**

Add `.ui-form` to any form to make all of the input elements inside of it look beautiful and consistent. ([Read More & Demos](https://base-styles.com/forms.md)).

```html
<form class="ui-form"></form>
```

**Styling Prose**

Wrap the `.ui-styled-text` class around any html designed to render articles, markdown, or prose. ([Read More & Demos](https://base-styles.com/styled-text.md)).

```html
<div class="ui-styled-text">
  <%= markdown_file_to_html("readme.md") %>
</div>
```


**Buttons**

Add the `.ui-button` class to any `<button>` or `<a>` element. ([Read More & Demos](https://base-styles.com/buttons.md)).

<div class="flex gap-2">
  <button class="ui-button --solid">Solid</button>
  <button class="ui-button">Normal</button>
  <button class="ui-button --minimal">Minimal</button>
</div>

```html
<button class="ui-button --solid">Solid</button>
<button class="ui-button">Normal</button>
<button class="ui-button --minimal">Minimal</button>
```

**Boxes**

Use the `.ui-box` class to create a section of elevated content. ([Read More & Demos](https://base-styles.com/boxes.md)).

```html
<div class="ui-box"></div>
```

**Titles**

Add the `.ui-title` class to any title, or create a `.ui-titlepair` for a title with a tagline. ([Read More & Demos](https://base-styles.com/titles.md)).

```html
<h3 class="ui-title">Coffee</h3>
```

```html
<div class="ui-titlepair">
  <h3 class="--title">Coffee</h3>
  <p class="--description">Size: XL</p>
</div>
```

**Chips**

Display a list of tags using the `.ui-chip` class. ([Read More & Demos](https://base-styles.com/chips.md)).

<div class="flex gap-2">
  <div class="ui-chip --sm --green">Green </div>
  <div class="ui-chip --sm --blue">Blue</div>
  <div class="ui-chip --sm --purple">Purple</div>
</div>

```html
<div class="ui-chip --sm --green">Default</div>
<div class="ui-chip --sm --blue">Solid</div>
<div class="ui-chip --sm --purple">Minimal</div>
```
**Tooltips**

Add an `aria-label` to an element alongside the `.ui-tooltip` class to get clean animated plain text tooltips.
[Read More & Demos](https://base-styles.com/tooltips.md)).


```html
<a href="#" class="ui-tooltip --top" aria-label="Use the ui-tooltip --top class">
  Tooltip Top
</a>
```

**Dropdowns**

Use popover elements wrapped in a `.ui-dropdown` to create customizable, styled dropdowns. ([Read More](https://base-styles.com/dropdowns.md) about Base Styles Dropdowns).


<div class="ui-dropdown">
  <button class="--trigger" popovertarget="dropdown-content">
    Click To Open
  </button>
  <div class="--drawer --bottom p-1 " id="dropdown-content" popover>
    <a class="ui-button --minimal">
      Google.com
    </a>
  </div>
</div>

```html
<div class="ui-dropdown">
  <button class="--trigger" popovertarget="dropdown-content">
    Click To Open
  </button>
  <div class="--drawer --bottom p-1 " id="dropdown-content" popover>
    <a class="ui-button --minimal">
      Google.com
    </a>
  </div>
</div>
```


**Modal Dialogs**

Use `commandfor` and add the `.ui-modal` class to your dialog element. ([Read More](https://base-styles.com/modals.md) about Base Styles modals).

<div>
<button class="ui-button --destructive" commandfor="confirm-modal" command="show-modal">Delete Record</button>
<dialog id="confirm-modal" class="ui-modal" closedby="any">
  <header class="--header">
    <h1 class="--title">Delete Record?</h1>
  </header>
  <p class="--description">Are you sure you want to delete this record? This action cannot be undone.</p>
  <footer class="--footer">
    <button class="ui-button" commandfor="confirm-modal" command="close">Cancel</button>
    <button class="ui-button --destructive" commandfor="confirm-modal" command="close">Delete</button>
  </footer>
</dialog>
</div>

```html
<button commandfor="confirm-dialog" command="show-modal">
  Delete Record
</button>
<dialog class="ui-modal" id="confirm-dialog" closedby="any" >
  <p>Are you sure? This action cannot be undone</p>
  <button class="ui-button">Continue</button>
</dialog>
```

**Modals From URL**

Combine `commandfor` and `command="show-dialog"` with `hx-get` and `hx-target` to open a modal from a remote url.


<div>
<button class="ui-button" commandfor="main-modal" command="show-modal" hx-get="/about" hx-target="#main-modal">
  Open
</button>
</div>


<div>
<button commandfor="main-modal" command="show-modal" hx-get="/about" hx-target="#main-modal">Open Remote Modal</button>
<dialog class="ui-modal" id="confirm-dialog" closedby="any">
  <p>Are you sure? This action cannot be undone</p>
  <button class="ui-button">Continue</button>
</dialog>
</div>

<br/>

# Simple Frontend Interactivity 

**Make an element dynamic, define some simple state, and render the value**

```html
<ui-state message="Hello World!">
  <div ui-text="message"></div>
</ui-state>
```

**Use javascript to update state from user interaction**

```html
<ui-state count="0">
  <button ui-click="count++">Increment</button>
  <div ui-text="count"></div>
</ui-state>
```

**React to changes in input values**

Use `this.value` to get the current value of the form input, and `ui-change` to listen for changes.

```html
<ui-state name="">
  <input type="text" ui-change="name = this.value" />
  <span ui-text="name"></span>
</ui-state>
```

**More Mini**

- There are 20+ mini attributes. See the full list [here](https://mini-js.com/reference.md).
- State variables get converted from dash case to camel case (`first-name` becomes `firstName`)


<br/>

# Deeper Frontend Interactivity


### Add a mini.js component to the html

Pass the `component` property to the `<ui-state>` tag to tell it which component to use, and pass in starting state where applicable.

```html
<ui-state component="counter" count="25">
</ui-state>
```

### Define the component in components.js

Use mini to create the component and manage state. Then use preact standalone to render it.

```javascript
import { html, render } from 'https://esm.sh/htm/preact/standalone';
MiniJS.register('counter', {
  init() {
    this.paint();
  },
  paint() {
    const Counter = () => html`
      <div>Content Here</div>
    `
    render(Counter(), this)
  }
})
```

### Use normal mini attributes to add behaviour

```javascript
import { html, render } from 'https://esm.sh/htm/preact/standalone';
MiniJS.register('counter', {
  init() {
    this.paint();
  },
  paint() {
    const Counter = () => html`
      <div ui-text="count"></div>
      <button ui-click="count++">+</button>
    `
    render(Counter(), this)
  }
})
```

### Use refs to access DOM elements within a component

```html
<ui-state component="counter">
  <input ref="primary-input" type="text">
</ui-state>
```

```javascript
MiniJS.register('counter', {
  init() {
    console.log(this.refs['primary-input'].value)
  }
})
```


<br/>

## Setup 

- Install Ruby 
- Run `bundle install`
- Run `ruby singlefile.rb`

<br/>

## Further Reading

- [html-first.com](https://html-first.com)
- [base-styles.com](https://base-styles.com)
- [mini-js.com](https://mini-js.com)
- [litewindcss.com](https://litewindcss.com)
- [htmx.org](https://htmx.org)
- [sinatrarb.com](https://sinatrarb.com)

<br/>

## FAQ

**Isn't this just Sinatra?**

Sort of, yes. The codebase uses Sinatra, which is designed to be a single file framework. We use it as a shell to provide some simple patterns (routing, templating) and act as glue to bring together several other frameworks that we've built. If you'd like to port this to your language of choice, we'd love to feature you.

**How did you decide on what libraries to include?**

We've spent a lot of time thinking about patterns for working effectively with HTML, in a way that goes with the grain of the web, and isn't tighly coupled to any particular framework. Base Styles was built to solve our own problems internally (effortless style and consistency), and Mini Js was similar. Both have been refined in production for 3 years across dozens of projects and codebases. We've evolved our approach and syntax over time and landed somewhere that we think is a good balance between simplicity and power.  


