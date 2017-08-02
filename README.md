# Lunchimizer

## Requirements

1. Ruby 2.4.1 
1. Rails 5.1
1. MySQL
1. Yarn
1. Node 6.3.0
1. XCode (for capybara-webkit)

## Dev steps

1. See https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit
1. `brew install qt@5.5`
1. `brew link --force qt@5.5`
1. `brew install yarn`
1. `bundle`
1. `sudo xcodebuild -license` if `bundle` is complaining about xcode license.
1. For XCode 8, `vim /usr/local/Cellar/qt@5.5/5.5.1_1/mkspecs/features/mac/default_pre.prf`, then replace the line according to https://stackoverflow.com/questions/39492617/xcode-8-error-project-error-xcode-not-set-up-properly-even-though-the-licens
1. `rake db:setup && rake db:migrate`
1. `rails s` 

## Screenshot

![Screenshot](/docs/screenshot.png)
