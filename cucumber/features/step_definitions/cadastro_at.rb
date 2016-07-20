Dado(/^que eu estou na home do Agile Testers$/) do
  visit "http://agiletesters.com.br/"
end

Quando(/^eu clicar em Cadastrar$/) do
  click_link "Cadastrar"
end

E(/^preencher os campos$/) do
  cadastro = Cadastro.new
  cadastro.endereco_email.set(@email)
  cadastro.nome_usuario.set(@usuario)
  cadastro.senha.set(@senha)
  cadastro.confirmar_senha.set(@senha)
end

Então(/^o cadastro deverá ser feito com sucesso$/) do
  click_button 'Registrar Agora'
end
