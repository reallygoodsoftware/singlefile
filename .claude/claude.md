# Core Frontend Patterns

- See @readme.md for core patterns.

# How To Write Code

Relevant Files
- litewind.css - a static version of Tailwind, found in /assets/vendor/litewind/
- base-styles.css - our core css system, found at /assets/vendor/base-styles/
- mini.js - a light javascript library for adding behaviour to html (simple), or creating components (advanced). The source is found in /assets/vendor/minijs/ - usually you won't need to read the source, but it can be useful for debugging.
- styles.css - used to set/override core css variables and add new custom variants and components. Found in /assets/css/styles.css.
- components.js - used to create and manage custom mini.js components. Found in /assets/js/components.js.

Guidelines
- When building out user interfaces, first use the relevant base styles classes where applicable, for example use `.ui-box` to create a section and `.ui-button` to create a button.
- If asked to change the styling of a base styles class in a minor way, simply add a tailwind (litewind) class to the html - tailwind classes override base styles classes.
- If asked to change the styling of a component in a more-than-minor way, create a new variant for that particular class in @assets/css/styles.css.
- Almost never add inline `style` attributes to the html directly.
- When asked to change or add a declaration that's likely to be global in nature, check base-styles.css to see if there is a relevant variable to override. If so, add it in the :root section of styles.css
- Use Tailwind classes for layout and positioning. Don't use tailwind classes for colors or font sizes.
- You're using a static version of Tailwind (Litewind). You don't have access to the Tailwind build step so you can only use whatever classes are in @assets/vendor/litewind/litewind.css file. DO NOT use any tailwind classes that contain square brackets - they will not work. Use only tailwind classes without square brackets.

# Interaction Guidelines
- If clicking an element opens a new form with an input for search, focus that input.
- When filtering a list of items, select the first item by default and add a visual indicator that it's selected.

# Common Failure Modes to avoid

- If a button is purely for user interaction, and not for form submission, always add `type="button"`, otherwise clicking it will cause a page refresh.