# APISync API Reference

This page uses Slate as template. To see how to edit it, go to
[editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax).

## Getting Started

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

```
git clone git@github.com:apisync/api-docs.git
cd api-docs
bundle install
bundle exec middleman server
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

### Deploying

You have to define the ENV variable `APISYNC_DEPLOY_USER`. Ask an admin for
the value.

Then run (given you have access to the server)

```
bundle exec cap production deploy
```
