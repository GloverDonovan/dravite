# Dravite

Finally, a consistent and reliable static site generator for the web.

**NOTE**: This project is incomplete. You can't use it yet.

## Todo

MVP:

- [ ] Separation of content from style and layout.
- [ ] Guide / recommended style guidelines.
- [ ] Customizable input and output directories.
- [ ] Page-specific variables (should these variables be in `data/` instead?)

Nice to haves:

- [ ] Watch input files and update the output files in real-time.
- [ ] Recommend [Yarn](https://yarnpkg.com/) as the dependency manager of choice.
- [ ] Support multiple CSS / JavaScript output files.
- [ ] Handle errors from Sass, Crinja, etc. gracefully.

## Directory structure

Note that below is not final.

- `app/*.js` - JavaScript files (combined to `app.js`).
- `data/*.yaml` - Data that should be accessible inside your templates.
- `includes/*.html` - HTML files to include in layouts.
- `layouts/*.html` - The various layouts of your website.
  - `default.html` - The default layout is used when no layout is given.
- `pages/*.{md,html}` - Pages can be in either markdown or HTML.
- `posts/*.{md,html}` - Posts are date-centric content, usually used for blogs.
- `style/*.{sass,scss,css}` - CSS files (combined to `design.css`).

## Output files

Note that the output files can be changed however you want.

- `app.js` - Main JavaScript file
- `design.css` - Main CSS file
- `*.html` - Top-level pages
- `**/*.html` - Other pages that aren't top-level pages

**TODO:** Determine whether or not top level pages should use their own folder by default (i.e. `/page.html` becomes `/page`).

From there, you can perform do other things such as minify the JavaScript file for production.

## Dependencies

- [markd](https://github.com/icyleaf/markd) - Markdown parser written in Crystal
- [crinja](https://github.com/straight-shoota/crinja) - Jinja2 implementation in Crystal
- [sass.cr](https://github.com/straight-shoota/sass.cr) - LibSass wrapper for Crystal
