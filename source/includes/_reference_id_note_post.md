* **reference-id:** quando presente e indicar um objeto que já exista no
nosso servidor, o objeto será _atualizado_, não criado. Por exemplo, na primeira
requisição com `{ "reference-id": "abc" }`, o objeto será criado. Na segunda
e posteriores requisições, o objeto em questão será atualizado porque um objeto
com o mesmo `reference-id` já foi criado.
