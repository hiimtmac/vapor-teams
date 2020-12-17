import Foundation
import TeamsKit

extension Activity {
    static func text(replyingTo: Activity) -> Activity {
        Activity.message(
            channelId: replyingTo.channelId,
            from: .webhookResponse,
            recipient: replyingTo.from,
            replyToId: replyingTo.id,
            conversation: replyingTo.conversation,
            entities: [.mention(mentioned: replyingTo.from, text: nil)],
            text: "**Hello!**, <at>\(replyingTo.from.name ?? "Unknown")</at>. From webooks\n>\(replyingTo.text ?? "Unknown message")",
            textFormat: .markdown
        )
    }
    
    static func hero(replyingTo: Activity) -> Activity {
        Activity.message(
            channelId: replyingTo.channelId,
            from: .webhookResponse,
            recipient: replyingTo.from,
            replyToId: replyingTo.id,
            conversation: replyingTo.conversation,
            entities: [.mention(mentioned: replyingTo.from, text: nil)],
            text: nil,
            textFormat: nil,
            attachment: Attachment.hero()
        )
    }
    
    static func thumbnail(replyingTo: Activity) -> Activity {
        Activity.message(
            channelId: replyingTo.channelId,
            from: .webhookResponse,
            recipient: replyingTo.from,
            replyToId: replyingTo.id,
            conversation: replyingTo.conversation,
            entities: [.mention(mentioned: replyingTo.from, text: nil)],
            text: nil,
            textFormat: nil,
            attachment: Attachment.thumbnail()
        )
    }
}
