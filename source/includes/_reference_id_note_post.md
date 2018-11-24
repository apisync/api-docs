* **reference-id:**
when present and referring to an existing object, that record will be _updated_,
not created. For example, on the first request with `{ "reference-id": "abc" }`,
the object will be created. On the second request, the object that that
`reference-id` already exists and therefore the object is updated.
