# lazy_load-rails
***Load page lazily as an when required***
***


lazy_load-rails is a gem that helps to **load page lazily** as an **when required**. The gem ***reduces page load time*** and ***reduces server ram*** by loading important content of the page in the first call and then by triggering calls to load the remaining page. The gem gives **Reactjs** like **functionality** in your ruby-on-rails application.

## Installation

Add this line to your application's **Gemfile**:

```ruby
gem 'lazy_load-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lazy_load-rails

Add the following line to your **application.js** file:

    //= require lazy_load

Add the following line to your **application.css** file:

    *= require lazy_load

## Usage
Call the following method from view file (.html.erb / .html.haml) and pass a url as a parameter

### .html.erb example

**Passing url as string**
```erb
<%= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications") %>
```
**Passing url string with parameters**
```erb
<%= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications?page=1&count=5") %>
```
**Passing url as helper method**
```erb
<%= lazy_load(notifications_path) %>
```
**Passing url as helper method with parameters**
```erb
<%= lazy_load(notifications_path(page: 1, count: 5)) %>
```
### Configuring lazy loading page
Configuration can be achieved by passing parameters to lazy_load method
Following are some **configuration examples**:
```erb
<%= lazy_load(notifications_path(page: 1, count: 5), id: "my_lazy_loader", type: "script", success: "afterSuccess()") %>

<%= lazy_load(notifications_path, class: "lazy_loaders", loader: "off", type: "json", failure: "afterFailure()", complete: "afterComplete(my_arg1, my_arg2)") %>

<%= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications?page=1&count=5", later: true, id: "later_lazy_loader",  failure: "onSuccess(my_arg1)", complete: "onComplete()") %>
```
### Note
When using configuration option `later: true` **explicit trigger** the request call.
By calling the function `delayedLoading(elementToLoad);` in your javascript and passing the **lazy_loading element/elements** as argument.
**lazy_loading element/elements has class** `lazy_load`

***Checkout the*** [***Demo***](http://lazy-loading-page-app.herokuapp.com/)

***lazy-loading-page app implementation*** [@Github](https://github.com/JigneshSatam/lazy_loading_page_app)


### .html.haml example:
```haml
= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications")

= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications?page=1&count=5")

= lazy_load(notifications_path)

= lazy_load(notifications_path(page: 1, count:5))

= lazy_load(notifications_path(page: 1, count: 5), id: "my_lazy_loader", type: "script", success: "afterSuccess()")

= lazy_load(notifications_path, class: "lazy_loaders", loader: "off", type: "json", failure: "afterFailure()", complete: "afterComplete(my_arg1, my_arg2)")

= lazy_load("http://lazy-loading-page-app.herokuapp.com/notifications?page=1&count=5", later: true, id: "later_lazy_loader",  failure: "onSuccess(my_arg1)", complete: "onComplete()")
```

## Configurations:

|Attributes|Defaults|Options|Description
|:----------:|:--------:|:-------:|-----------|
|type|null|script/json|**Type of request** to be made.|
|later|null|true|This will **stop the implicit loading** of the request, so that user can **explicit load the request** when required.|
|id|null|`userdefined`|Can **attach ID** to the object loaded in the DOM, it can be **helpful in explicit loading** of the request.|
|loader|on|off|This can be used to **turn on / off** the **loading effect**.|
|class|null|`userdefined`|Can **attach class** to the object loaded in the DOM, it can be **helpful in explicit loading** of the request.|

## Callbacks:

|Callback|Example|Description
|:-----:|-----------|---------|
|success| functionAfterSuccess(arg1, arg2); |This function will be called when the request is successful.|
|failure| functionAfterFailure(arg1, arg2); |This function will be called when the request fails.|
|complete| functionAfterComplete(arg1, arg2); |This function will be called when the request is completed.|

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/lazy_load-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
