# encoding: utf-8
#!/usr/bin/env ruby

Before do
  page.driver.browser.manage.window.maximize
  @senha = Faker::Base.numerify('inicial####')
  @email = Faker::Internet.email
  @usuario = Faker::StarWars.planet
end

After do
  Capybara.reset_sessions!
end
