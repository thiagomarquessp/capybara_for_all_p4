# encoding: utf-8
#!/usr/bin/env ruby

class Cadastro < SitePrism::Page
  element :endereco_email, "input[id='email']"
  element :nome_usuario, "input[id='username']"
  element :senha, "input[id='password']"
  element :confirmar_senha, "input[id='password-confirm']"
end
