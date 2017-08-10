# Itens do estoque

Um **Item do estoque** representa uma mercadoria.

## A entidade

Estes são os atributos deste resource.

```json
{
  "data": {
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "attributes": {
      "reference-id": "my-custom-id",
      "created-at": "2017-21-04T13:00:00Z",
      "price": 2117990,
      "item-type": "vehicle",
      "uri": "https://mywebsite.com/products/volkswagen-gol-2011",
      "custom-fields": {
        "my-own-key": "some-value",
        "make": "Volkswagen",
        "model": "Gol",
        "year":  2011
        "city":  "São Paulo"
      },
    }
  }
}
```

Atributo            | Tipo    | Descrição
------------------- | ------- | -----------
reference&#8209;id  | string, opcional | Identificador do item no banco de dados do cliente. Se você deixar em branco, você precisará guardar o id retornado para poder sincronizar o item conosco.
custom&#8209;fields | object  | Objeto contendo valores que descrevem o item.
uri                 | string, opcional | Se o item possui uma página na internet.
price               | integer, opcional | Preço do item com centavos, ex.: `1012` para `R$10,12`.
item&#8209;type     | string  | String livre com o tipo do item.
created&#8209;at    | string, readonly  | Data de criação do registro, formato ISO-8601.

**custom-fields:** use um objeto json aqui que descreva seu item. As chaves e
valores são livres. Todas as chaves serão convertidas para formato com hífen.
Ex.: `my_key` se torna `my-key`.

**uri:** quando especificado, anúncios levaram o usuário para esta URI. Caso não
específicado, usuários verão o produto em uma tela genérica.

**item-type:** este valor identifica o tipo do item e é usado, por exemplo,
para geração de anúncios específicos. Por exemplo,
temos templates de anúncios para itens do tipo `vehicle` (carros).
Portanto, use o valor `vehicle` aqui se o item é um carro.

No editor de templates de anúncios, no painel de administração, você define o
alvo dos templates. Você pode definir templates qualquer tipo. Por exemplo,
se você possui vinhos e quer segmentar os templates, pode criar itens como
`vinho-cabernet-sauvignon` e `vinho-merlot`.

## Lendo itens

```shell
curl -H "Authorization: Bearer $TOKEN" "https://api.apisync.io/inventory-items"
```

```ruby
client = ApiSync.new(api_key: token)
client.inventory_items.list
```

> O comando acima retorna um JSON estruturado como este:

```json
{
  "data": [{
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "attributes": {
      "reference-id": "my-custom-id",
      "created-at": "2017-21-04T13:00:00Z",
      "price": 2117990,
      "item-type": "vehicle",
      "uri": "https://mywebsite.com/products/volkswagen-gol-2011",
      "custom-fields": {
        "my-own-key": "some-value",
        "make": "Volkswagen",
        "model": "Gol",
        "year":  2011
        "city":  "São Paulo"
      },
    }
  }]
}
```

`GET /inventory-items`

Estes são os possíveis parâmetros:

Parâmetro | Descrição
--------- | -----------
filter    | Para filtrar atributos.
page      | A página que você deseja ver. Se não especificado, o valor é 1.

### Exemplos

`GET /inventory-items?page[number]=3&page[size]=20`

Retorna a terceira página, 20 itens por página.

`GET /inventory-items?filter[reference-id]=my-id`

Retornará apenas itens onde reference-id é `my-id`.

## Lendo um item específico

```shell
curl -H "Authorization: Bearer $TOKEN" "https://api.apisync.io/inventory-items/35b87e73-3fec-4f2c-86dd-6afe36a0dbd2"
```

```ruby
client = ApiSync.new(api_key: token)
client.inventory_items.find("35b87e73-3fec-4f2c-86dd-6afe36a0dbd2")
```

> O comando acima retorna um JSON estruturado como este:

```json
{
  "data": {
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "attributes": {
      "reference-id": "my-custom-id",
      "created-at": "2017-21-04T13:00:00Z",
      "price": 2117990,
      "item-type": "vehicle",
      "uri": "https://mywebsite.com/products/volkswagen-gol-2011",
      "custom-fields": {
        "my-own-key": "some-value",
        "make": "Volkswagen",
        "model": "Gol",
        "year":  2011
        "city":  "São Paulo"
      },
    }
  }
}
```

`GET /inventory-items/:id`

Você deve especificar o ID do item que você deseja ver.

### Exemplos

`GET /inventory-items/35b87e73-3fec-4f2c-86dd-6afe36a0dbd2`

Retornará apenas o item que tem o ID `35b87e73-3fec-4f2c-86dd-6afe36a0dbd2`.

## Criando itens

`POST /inventory-items`

Em caso de sucesso, você receberá de volta a entidade criada. Caso contrário,
uma mensagem de erro.

## Atualizando itens

`PATCH /inventory-items/:id`

Você deve substituir `:id` pelo ID único do registro que você quer
atualizar.

Caso a requisição funcione, você receberá de volta a entidade. Caso contrário,
uma mensagem de erro.
