### Conhecendo os Hooks Before e After

Bem, primeiramente deixar claro que o objetivo aqui é passar o que de fato vocês vão utilizar, que no caso, será os hooks Before e After que eu vou chamá-lo de Hooks Globais, ou seja, todo cenário que eu tenho definido nos meus arquivos de feature ele vai ter alguma ação Antes (Before) e Depois (Ater). Essas ações podem ser quaisuqer uma, desde um maximize na tela onde o teste é executado até comandos básicos (o que geralmente ocorre mais).

```ruby
Before do
  # Aqui você coloca tudo que você quer executar antes de cada cenário.
  # Por exemplo um fluxo de Login, onde pra iniciar o teste o pré requisito é estar logado.
  page.driver.browser.manage.window.maximize
  # Já diz tudo o que ele faz neh (nesse caso específico). Ele coloca o navegador em formato maximizado.
end

Before ('@general') do
  # Aqui você coloca tudo que você quer executar antes de algum cenário.
  # ('@general') foi só um nome que eu dei para esse before, pois nem sempre tenho que rodar todos os befores que existem, caso eu tenha algum before específico para rodar antes de algum cenário, eu tenho que dar um nome a ele e chamá-lo no meu arquivo de feature. Veremos isso mais pra frente =).
end

After do
  # Aqui você coloca tudo que você quer executar após cada cenário.
  Capybara.reset_sessions!
  # Nesse caso específico, ele da um reset na sessão do navegador após os testes.
end

After ('@general') do
  # Segue o mesmo esquema do Before, só que agora ele faz um After específico para o fim de um cenário específico.
end
```
Para saber um pouco mais sobre os Hooks e suas propriedades, acessem o [github](https://github.com/cucumber/cucumber/wiki/Hooks) do cucumber e de lá o céu é o limite =).
