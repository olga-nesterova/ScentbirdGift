# Getting Started
### Instalation
1. First, you will need to install [rvm](https://rvm.io/) (Ruby Version Manager) on your system

You can follow these instalation manuals:
- macOS: https://nrogap.medium.com/install-rvm-in-macos-step-by-step-d3b3c236953b
- Windows: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-and-set-up-a-local-programming-environment-on-windows-10

2. Next, install ruby v2.7.2 by running this command: `rvm install 2.7.2`
3. Then, set it as default: `rvm alias create default 2.7.2`
4. Download [chromedriver](https://chromedriver.chromium.org/downloads) and add it to the path manually or by running this command (via Homebrew): `brew install chromedriver`
5. Install [Allure](https://docs.qameta.io/allure/#_get_started) `brew install allure`
6. Finally, navigate to the root of the project and run `bundle install` to install all the dependencies

# Usage

To run sample test automation: `bundle exec rspec`
or for individual specs: `rspec spec/name_of_each_spec`

## Report
To generate and view test results in a single report run `allure serve report/allure-results/`
