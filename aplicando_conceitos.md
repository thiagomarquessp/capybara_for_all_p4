### Aplicando os conceitos

Bem ... de novo .. partindo do princípio que todos leram da parte I a III ou sabem trabalhar com o framework a linguagem vai ser mais direta OK.

Receita básica do bolo:

```ruby
1. cucumber --init

2. Deixar a seguinte estrutura:
  cucumber
  cucumber/Gemfile
  cucumber/features
  cucumber/features/specifications
  cucumber/features/step_definitions
  cucumber/features/support
  cucumber/features/support/env.rb

3. Deixar da seguinte forma o nosso arquivo Gemfile:
  source "https://rubygems.org"

  gem "cucumber"
  gem "capybara"
  gem "selenium-webdriver"
  gem "faker"
  gem "cpf_faker"
  gem "site_prism"

4. Deixar da seguinte forma o arquivo env.rb:
  require "capybara/cucumber"
  require "selenium-webdriver"
  require "site_prism"
  require "faker"
  require "cpf_faker"

  Capybara.default_driver = :selenium
  Capybara.default_max_wait_time = 10
  ```
