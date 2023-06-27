import Vapor
import TeamsKit
import VaporTeams

let application = try Application(.detect())
defer { application.shutdown() }

// MARK: - Outgoing webhook
// https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-outgoing-webhook

// MARK: Text response answer
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: Environment.get(.TEXT_SECRET)))
    .post("outgoing-text") { (req: Request) throws -> Activity in
        let message = try req.content.decode(Activity.self, using: JSONDecoder.teams)
        
        let act = Activity.text(replyingTo: message)
        
//        print(String(decoding: try JSONEncoder.teams.encode(act), as: UTF8.self))
        
        return act
    }

// MARK: Hero card answer
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: Environment.get(.HERO_SECRET)))
    .post("outgoing-hero") { (req: Request) throws -> Activity in
        let message = try req.content.decode(Activity.self, using: JSONDecoder.teams)
        
        let act = Activity.hero(replyingTo: message)
        
//        print(String(decoding: try JSONEncoder.teams.encode(act), as: UTF8.self))
        
        return act
    }

// MARK: Thumbnail card answer
application
    .grouped(OutgoingWebhookAuthenticator(secretKey: Environment.get(.THUMBNAIL_SECRET)))
    .post("outgoing-thumbnail") { (req: Request) throws -> Activity in
        let message = try req.content.decode(Activity.self, using: JSONDecoder.teams)
        
        let act = Activity.thumbnail(replyingTo: message)
        
//        print(String(decoding: try JSONEncoder.teams.encode(act), as: UTF8.self))
        
        return act
    }

// MARK: - Incoming Webhook
// https://docs.microsoft.com/en-us/microsoftteams/platform/webhooks-and-connectors/how-to/add-incoming-webhook
// Make sure url is outlook.office365.com (teams made a url with outlook.office.com for me)

// MARK: O365Connector Card
application
    .get("incoming-o365") { req -> EventLoopFuture<HTTPStatus> in
        let connector = O365ConnectorCard.example()
        let uri = URI(string: Environment.get(.INCOMING_WEBHOOK))
                
        return req.client.post(uri) { req in
            try req.content.encode(connector)
        }
        .map { response in
//            print(response)
            return response.status
        }
}

try application.run()
