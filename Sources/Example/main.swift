import Vapor
import TeamsKit
import VaporTeams

let application = try Application(.detect())
defer { application.shutdown() }

// Outgoing Webhook Example
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: Environment.get(.WEBHOOK_SECRET)))
    .post("webhook") { (req: Request) throws -> Activity in
        
        let message = try req.content.decode(Activity.self, using: JSONDecoder.teams)
        
        return Activity.message(
            channelId: message.channelId,
            from: .webhookResponse,
            conversation: message.conversation,
            entities: [.mention(.init(mentioned: message.from, text: nil))],
            text: "**Hello!**, <at>\(message.from.name ?? "Unknown")</at>. From webooks\n>\(message.text ?? "Unknown message")",
            textFormat: .markdown,
            locale: nil,
            speak: nil,
            inputHint: nil,
            summary: nil,
            suggestedActions: nil,
            expiration: nil,
            listenFor: nil,
            semanticAction: nil
        )
    }

try application.run()
