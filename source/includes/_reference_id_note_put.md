* **reference-id:** se
outro objeto já possuir o mesmo valor de `reference-id`, uma mensagem de erro
será retornada e o item não será salvo. Se você quer atualizar um objeto mas não
sabe seu `id`, faça uma requisição `POST` usando o respectivo `reference-id`
e então seu objeto será atualizado (dado que ele exista no nosso servidor).
