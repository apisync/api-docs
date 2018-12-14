## Lendo itens

```ruby
client = Apisync.new(api_key: token)
client.inventory_items.list
```

> O comando acima retorna um JSON estruturado como este:

```json
{
  "data": [{
    "id": "35b87e73-3fec-4f2c-86dd-6afe36a0dbd2",
    "attributes": {
<%= partial("includes/inventory_item_examples/json_response_attributes.erb").rstrip %>
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

Para `filter`, apenas os seguintes atributos são suportados:

* `ad_template_type`
* `available`
* `condition`
* `reference_id`

### Exemplos

`GET /inventory-items?page[number]=3&page[size]=20`

Retorna a terceira página, 20 itens por página.

`GET /inventory-items?filter[reference_id]=my-id`

Retornará apenas itens onde reference&lowbar;id é `my-id`.

