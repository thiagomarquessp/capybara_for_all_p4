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

5. Nosso arquivo de feature vai se chamar cadastro.feature dentro da pasta specifications. Vamos realizar o cadastro no site do meu amigo Leo Galani, vulgo Agile Testers =). Vai ficar desse jeito:

#language: pt

Funcionalidade: Cadastro no portal Agile Testers

Cenario: Cadastro com sucesso utilizando Page Objects e Hooks e Faker Generator

Dado que eu estou na home do Agile Testers
Quando eu clicar em Cadastrar
E preencher os campos
Então o cadastro deverá ser feito com sucesso

6. Criar nosso arquivo de Page Objects na pasta support chamado page_objects.rb e vai ficar desse jeito:

# encoding: utf-8
#!/usr/bin/env ruby

class Cadastro < SitePrism::Page
  element :endereco_email, "input[id='email']"
  element :nome_usuario, "input[id='username']"
  element :senha, "input[id='password']"
  element :confirmar_senha, "input[id='password-confirm']"
end

7. Vamos criar nosso arquivo de Hooks e definir nosso primeiro Before e Afer \o/. Então dentro da pasta support vamos criar o arquivo chamado hooks.rb e dentro dele vai conter a seguinte estrutura:

# encoding: utf-8
#!/usr/bin/env ruby

Before do
  page.driver.browser.manage.window.maximize
  @cadastro = Cadastro.new
  @senha = Faker::Base.numerify('inicial####')
  @email = Faker::Internet.email
  @usuario = Faker::StarWars.planet
end

After do
  Capybara.reset_sessions!
end

# Para explicar o que eu fiz dentro desse arquivo basta dizer que antes dos testes rodarem, ele vai maximizar a tela e instanciar a classe que foi definida no Page Objects e carregar 3 variáveis que eu vou utilizar no meu cadastro: senha, email e usuario para que lá no meu teste eu possa apenas colocá-la, deixando assim bem clean nosso código. E ao terminar os testes, ele da um reset na sessão.

8. Criar o nosso arquivo na pasta step_definitions chamado cadastro_at.rb da seguinte maneira:

Dado(/^que eu estou na home do Agile Testers$/) do
  visit "http://agiletesters.com.br/"
end

Quando(/^eu clicar em Cadastrar$/) do
  click_link "Cadastrar"
end

E(/^preencher os campos$/) do
  cadastro = Cadastro.new
  cadastro.endereco_email.set(@email) #Variável que foi carregada antes mesmo do teste começar (Before) eu utilizo em qualquer lugar.
  cadastro.nome_usuario.set(@usuario) #Variável que foi carregada antes mesmo do teste começar (Before) eu utilizo em qualquer lugar.
  cadastro.senha.set(@senha) #Variável que foi carregada antes mesmo do teste começar (Before) eu utilizo em qualquer lugar.
  cadastro.confirmar_senha.set(@senha) #Variável que foi carregada antes mesmo do teste começar (Before) eu utilizo em qualquer lugar.
end

Então(/^o cadastro deverá ser feito com sucesso$/) do
  click_button 'Registrar Agora'
end

Obs.: Lembre-se que para criar a estrutura dos steps, basta rodar o comando "cucumber" que ele gera as RegEx para colocar no arquivo de steps.

9. Rodar o comando cucumber pra ver a mágica acontecer e o resultado será o sequinte:

# language: pt
Funcionalidade: Cadastro no portal Agile Testers

  Cenario: Cadastro com sucesso utilizando Page Objects e Hooks e Faker Generator # features/specifications/cadastro_at.feature:5
    Dado que eu estou na home do Agile Testers                                    # features/step_definitions/cadastro_at.rb:1
    Quando eu clicar em Cadastrar                                                 # features/step_definitions/cadastro_at.rb:5
    E preencher os campos                                                         # features/step_definitions/cadastro_at.rb:9
    Então o cadastro deverá ser feito com sucesso                                 # features/step_definitions/cadastro_at.rb:17

1 scenario (1 passed)
4 steps (4 passed)
0m4.772s

UAU ... em quase 5 segundos eu realizo um cadatro =).

10. Aplicar em qualquer contexto que vai dar certo. E de novo, não importa o que você queira carregar no Befor e After, isso fica a seu critério e da sua necessidade.
```
