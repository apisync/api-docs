# Erros

Estes são os erros que podem ser retornados sempre que uma requisição for
feita.

Código HTTP | Significado
---------- | -------
400 | Sua requisição está incorreta.
401 | Sua API key é inválida.
403 | Você requisitou um resource que você não tem permissão.
404 | O item requisitado não pode ser encontrado.
405 | O método que você utilizou não existe ou não é suportado.
406 | Sua requisição está em um formato não aceitável.
410 | O resource requisitado não existe mais no servidor.
429 | Você está realizando muitos requests, mais do que sua conta permite.
Diminua a quantidade de requests por minuto.
500 | Houve um problema temporário no servidor. Tente novamente.
503 | Serviço não disponível porque estamos em manutenção.
