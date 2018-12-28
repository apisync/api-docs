# Errors

These are the errors we return when a request goes wrong.

HTTP&nbsp;Code | Meaning
---------- | -------
400 | Incorrect request.
401 | Invalid API key.
403 | You don't have permission to see this resource.
404 | Resource can't be found.
405 | The method you used isn't supported.
406 | Request format is not supported.
410 | Resource doesn't exist anymore.
422 | Request is good but can't be processed due to semantic errors.
429 | You are doing too many requests, slow down.
500 | Temporary server problem. Try again.
503 | We're in maintenance.
