# teams-kit

A description of this package.

```swift
dependencies: [
    .package(url: "https://github.com/hiimtmac/teams-kit.git", .branch("master"))
],
targets: [
    .target(name: "Example", dependencies: [
        .product(name: "VaporTeams", package: "eams-kit"),
        .product(name: "TeamsKit", package: "teams-kit") // if you want to use vapor
        .product(name: "Vapor", package: "vapor") // if you want to use vapor
    ])
]
```

> pre-release and subject to change

## Outgoing Webhook

[See here](https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-outgoing-webhook) how to setup a outgoing webhook

### Validate Teams Clients

Make sure to validate the post body to make sure it actually comes from a teams client. This can be done using an extension on `Data`:

```swift
Data("my data".utf8).validate(
    code: hmacCode, // this will come in header Authorization: "HMAC sd...d="
    withSecret: teamsSecret // this comes from teams when you setup webhook
)
```

> [Verify the outgoing webhook hmac token](https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-outgoing-webhook#2-create-a-method-to-verify-the-outgoing-webhook-hmac-token)

### Vapor Authenticator

Use the `OutgoingWebhookAuthenticator` to guard your routes to ensure they are only accessed by valid teams clients

```swift
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: teamsSecret))
    .post("outgoing-webhook") { ... }
```

### Decoding Activity

Decode post body `Activity` from teams using the custom `JSONDecoder.teams` decoder (handles that way microsoft encodes their dates/timestamps)

```swift
let message = try req.content.decode(Activity.self, using: JSONDecoder.teams)
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
