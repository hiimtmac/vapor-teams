# vapor-teams

> pre-release and subject to change

## Vapor Authenticator

Use the `OutgoingWebhookAuthenticator` to guard your routes to ensure they are only accessed by valid teams clients

```swift
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: teamsSecret))
    .post("outgoing-webhook") { ... }
```

### Reponses

Respond to the post request with one of the following

Working:

- Message with text [Example](Sources/Example/main.swift#L12)
- `HeroCard` (return `Activity` with `HeroCard` in `Attachment`) [Example](Sources/Example/main.swift#L26)
- `ThumbnailCard` (return `Activity` with `ThumbnailCard` in `Attachment`) [Example](Sources/Example/main.swift#L39)

Not Working:

- `O365ConnectorCard` [Example](Sources/Example/main.swift#L56)

## Incoming webhook

[See here](https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook) how to setup a incoming webhook

> Make sure to add `365` to the url teams gives you (outlook.office365.com... teams made a url with outlook.office.com... for me)

Post the data of the message to the webhook url

Working:

- `O365ConnectorCard` [Example](Sources/Example/main.swift)
