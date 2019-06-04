# Authorization

> To authenticate a request, send your API token in the header:

```
curl -H "Authorization: ApiToken $API_TOKEN" \
     "https://api.apisync.io/inventory-items"
```

Every customer has a unique API token to access endpoints. You can find yours in
the dashboard.

You must include your API token in every request you make using the
`Authorization` header in the format
`Authorization: ApiToken $API_TOKEN`.

<aside class="notice">
Replace <code>$API_TOKEN</code> with your actual API token.
</aside>

Without this, we cannot know who's using the API and you won't be able to access
your data.

