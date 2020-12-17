import Foundation

/// Defines a message that is exchanged between bot and user.
public struct Activity: Codable {
    /// Type of activity.
    public let type: ActivityType
    /// An ID that uniquely identifies the channel. Set by the channel.
    public let channelId: String
    /// ID that uniquely identifies the activity on the channel.
    public let id: String?
    /// Date and time that the message was sent in the UTC time zone, expressed in ISO-8601 format.
    public let timestamp: Date?
    /// Contains the name of the local timezone of the message, expressed in IANA Time Zone database format. For example, America/Los_Angeles.
    public let localTimezone: String?
    /// Date and time that the message was sent in the local time zone, expressed in ISO-8601 format.
    public let localTimestamp: Date?
    /// A ChannelAccount object that specifies the sender of the message.
    public let from: ChannelAccount
    /// A ChannelAccount object that specifies the recipient of the message.
    public let recipient: ChannelAccount?
    /// A ConversationAccount object that defines the conversation to which the activity belongs.
    public let conversation: ConversationAccount
    /// The ID of the message to which this message replies.
    public let replyToId: String?
    /// Array of objects that represents the entities that were mentioned in the message.
    public let entities: [Entity]?
    /// An object that contains channel-specific content.
    public let channelData: ChannelData?
    /// A string containing an IRI identifying the caller of a bot.
    public let callerId: String?
    /// URL that specifies the channel's service endpoint.
    public let serviceUrl: URL?
    /// Text of the message that is sent from user to bot or bot to user.
    public let text: String?
    /// Format of the message's text.
    public let textFormat: TextFormat?
    /// Locale of the language that should be used to display text within the message. Default value is en-US.
    public let locale: String?
    /// Text to be spoken by your bot on a speech-enabled channel.
    public let speak: String?
    /// Value that indicates whether your bot is accepting, expecting, or ignoring user input after the message is delivered to the client.
    public let inputHint: InputHint?
    /// Array of Attachment objects that defines additional information to include in the message.
    public let attachments: [Attachment]?
    /// Layout of the rich card attachments that the message includes.
    public let attachmentLayout: AttachmentLayout?
    /// Summary of the information that the message contains.
    public let summary: String?
    /// A SuggestedActions object that defines the options from which the user can choose.
    public let suggestedActions: SuggestedActions?
    /// The time at which the activity should be considered to be "expired" and should not be presented to the recipient.
    public let expiration: Date?
    /// Defines the importance of an Activity. One of these values: low, normal, high.
    public let importance: Importance?
    /// A delivery hint to signal to the recipient alternate delivery paths for the activity.
    public let deliveryMode: DeliveryMode?
    /// List of phrases and references that speech and language priming systems should listen for.
    public let listenFor: String?
    /// A SemanticAction object that represents a reference to a programmatic action.
    public let semanticAction: SemanticAction?
    /// Topic of the conversation to which the activity belongs.
    public let topicName: String?
    /// Flag that indicates whether or not history is disclosed.
    public let historyDisclosed: Bool?
    /// The action to apply or that was applied.
    public let action: Action?
    /// Array of ChannelAccount objects that represents the list of users that joined the conversation.
    public let membersAdded: [ChannelAccount]?
    /// Array of ChannelAccount objects that represents the list of users that left the conversation.
    public let membersRemoved: [ChannelAccount]?
    /// Code indicating why the conversation has ended.
    public let code: String?
    /// A descriptive label for the activity.
    public let label: String?
    /// The collection of reactions added to the conversation.
    public let reactionsAdded: [MessageReaction]?
    /// The collection of reactions removed from the conversation.
    public let reactionsRemoved: [MessageReaction]?
    /// The collection of text fragments to highlight when the activity contains a replyToId value.
    public let textHighlights: [TextHighlight]?
    
    public init(
        type: ActivityType,
        channelId: String,
        id: String? = nil,
        timestamp: Date? = nil,
        localTimezone: String? = nil,
        localTimestamp: Date? = nil,
        from: ChannelAccount,
        recipient: ChannelAccount? = nil,
        conversation: ConversationAccount,
        replyToId: String? = nil,
        entities: [Entity]? = nil,
        channelData: ChannelData? = nil,
        callerId: String? = nil,
        serviceUrl: URL? = nil,
        text: String? = nil,
        textFormat: TextFormat? = nil,
        locale: String? = nil,
        speak: String? = nil,
        inputHint: InputHint? = nil,
        attachments: [Attachment]? = nil,
        attachmentLayout: AttachmentLayout? = nil,
        summary: String? = nil,
        suggestedActions: SuggestedActions? = nil,
        expiration: Date? = nil,
        importance: Importance? = nil,
        deliveryMode: DeliveryMode? = nil,
        listenFor: String? = nil,
        semanticAction: SemanticAction? = nil,
        topicName: String? = nil,
        historyDisclosed: Bool? = nil,
        action: Action? = nil,
        membersAdded: [ChannelAccount]? = nil,
        membersRemoved: [ChannelAccount]? = nil,
        code: String? = nil,
        label: String? = nil,
        reactionsAdded: [MessageReaction]? = nil,
        reactionsRemoved: [MessageReaction]? = nil,
        textHighlights: [TextHighlight]? = nil
    ) {
        self.type = type
        self.channelId = channelId
        self.id = id
        self.timestamp = timestamp
        self.localTimezone = localTimezone
        self.localTimestamp = localTimestamp
        self.from = from
        self.recipient = recipient
        self.conversation = conversation
        self.replyToId = replyToId
        self.entities = entities
        self.channelData = channelData
        self.callerId = callerId
        self.serviceUrl = serviceUrl
        self.text = text
        self.textFormat = textFormat
        self.locale = locale
        self.speak = speak
        self.inputHint = inputHint
        self.attachments = attachments
        self.attachmentLayout = attachmentLayout
        self.summary = summary
        self.suggestedActions = suggestedActions
        self.expiration = expiration
        self.importance = importance
        self.deliveryMode = deliveryMode
        self.listenFor = listenFor
        self.semanticAction = semanticAction
        self.topicName = topicName
        self.historyDisclosed = historyDisclosed
        self.action = action
        self.membersAdded = membersAdded
        self.membersRemoved = membersRemoved
        self.code = code
        self.label = label
        self.reactionsAdded = reactionsAdded
        self.reactionsRemoved = reactionsRemoved
        self.textHighlights = textHighlights
    }
}

extension Activity {
    public static func contactRelationUpdate(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        action: Action
    ) -> Activity {
        self.init(
            type: .contactRelationUpdate,
            channelId: channelId,
            from: from,
            conversation: conversation,
            action: action
        )
    }
    
    public static func installationUpdate(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        action: Action
    ) -> Activity {
        self.init(
            type: .installationUpdate,
            channelId: channelId,
            from: from,
            conversation: conversation,
            action: action
        )
    }
    
    public static func conversationUpdate(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        membersAdded: [ChannelAccount],
        membersRemoved: [ChannelAccount],
        topicName: String?,
        historyDisclosed: Bool = false
    ) -> Activity {
        self.init(
            type: .conversationUpdate,
            channelId: channelId,
            from: from,
            conversation: conversation,
            topicName: topicName,
            historyDisclosed: historyDisclosed,
            membersAdded: membersAdded,
            membersRemoved: membersRemoved
        )
    }
    
    public static func endOfConversation(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        code: String,
        text: String?
    ) -> Activity {
        self.init(
            type: .endOfConversation,
            channelId: channelId,
            from: from,
            conversation: conversation
        )
    }
    
    public static func messageDelete(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        id: String
    ) -> Activity {
        self.init(
            type: .messageDelete,
            channelId: channelId,
            id: id,
            from: from,
            conversation: conversation
        )
    }
    
    public static func messageUpdate(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        id: String
    ) -> Activity {
        self.init(
            type: .messageUpdate,
            channelId: channelId,
            id: id,
            from: from,
            conversation: conversation
        )
    }
    
    public static func messageReaction(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        id: String,
        reactionsAdded: [MessageReaction],
        reactionsRemoved: [MessageReaction]
    ) -> Activity {
        self.init(
            type: .messageReaction,
            channelId: channelId,
            id: id,
            from: from,
            conversation: conversation,
            reactionsAdded: reactionsAdded,
            reactionsRemoved: reactionsRemoved
        )
    }
    
    public static func suggestion(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        replyToId: String?,
        recipient: ChannelAccount,
        text: String,
        textHighlights: [TextHighlight]
    ) -> Activity {
        self.init(
            type: .suggestion,
            channelId: channelId,
            from: from,
            recipient: recipient,
            conversation: conversation,
            replyToId: replyToId,
            text: text,
            textHighlights: textHighlights
        )
    }
    
    public static func typying(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount
    ) -> Activity {
        self.init(
            type: .typing,
            channelId: channelId,
            from: from,
            conversation: conversation
        )
    }
    
    public static func handoff(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount
    ) -> Activity {
        self.init(
            type: .handoff,
            channelId: channelId,
            from: from,
            conversation: conversation
        )
    }
    
    public static func message(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        entities: [Entity]?,
        text: String?,
        textFormat: TextFormat?,
        locale: String?,
        speak: String?,
        inputHint: InputHint?,
        summary: String?,
        suggestedActions: SuggestedActions?,
        expiration: Date?,
        importance: Importance = .normal,
        deliveryMode: DeliveryMode = .normal,
        listenFor: String?,
        semanticAction: SemanticAction?
    ) -> Activity {
        self.init(
            type: .message,
            channelId: channelId,
            from: from,
            conversation: conversation,
            entities: entities,
            text: text,
            textFormat: textFormat,
            locale: locale,
            speak: speak,
            inputHint: inputHint,
            summary: summary,
            suggestedActions: suggestedActions,
            expiration: expiration,
            importance: importance,
            deliveryMode: deliveryMode,
            listenFor: listenFor,
            semanticAction: semanticAction
        )
    }
    
    public static func message(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        entities: [Entity]?,
        text: String?,
        textFormat: TextFormat?,
        locale: String?,
        speak: String?,
        inputHint: InputHint?,
        attachment: Attachment,
        summary: String?,
        suggestedActions: SuggestedActions?,
        expiration: Date?,
        importance: Importance = .normal,
        deliveryMode: DeliveryMode = .normal,
        listenFor: String?,
        semanticAction: SemanticAction?
    ) -> Activity {
        self.init(
            type: .message,
            channelId: channelId,
            from: from,
            conversation: conversation,
            entities: entities,
            text: text,
            textFormat: textFormat,
            locale: locale,
            speak: speak,
            inputHint: inputHint,
            attachments: [attachment],
            summary: summary,
            suggestedActions: suggestedActions,
            expiration: expiration,
            importance: importance,
            deliveryMode: deliveryMode,
            listenFor: listenFor,
            semanticAction: semanticAction
        )
    }
    
    public static func message(
        channelId: String,
        from: ChannelAccount,
        conversation: ConversationAccount,
        entities: [Entity]?,
        text: String?,
        textFormat: TextFormat?,
        locale: String?,
        speak: String?,
        inputHint: InputHint?,
        attachments: [Attachment],
        attachmentLayout: AttachmentLayout,
        summary: String?,
        suggestedActions: SuggestedActions?,
        expiration: Date?,
        importance: Importance = .normal,
        deliveryMode: DeliveryMode = .normal,
        listenFor: String?,
        semanticAction: SemanticAction?
    ) -> Activity {
        self.init(
            type: .message,
            channelId: channelId,
            from: from,
            conversation: conversation,
            entities: entities,
            text: text,
            textFormat: textFormat,
            locale: locale,
            speak: speak,
            inputHint: inputHint,
            attachments: attachments,
            attachmentLayout: attachmentLayout,
            summary: summary,
            suggestedActions: suggestedActions,
            expiration: expiration,
            importance: importance,
            deliveryMode: deliveryMode,
            listenFor: listenFor,
            semanticAction: semanticAction
        )
    }
}

extension Activity {
    public enum Action: String, Codable {
        case add
        case remove
    }
}

extension Activity {
    public enum DeliveryMode: String, Codable {
        case normal
        case notification
    }
}
 
extension Activity {
    public enum InputHint: String, Codable {
        case acceptingInput
        case expectingInput
        case ignoringInput
    }
}

extension Activity {
    public enum TextFormat: String, Codable {
        case markdown
        case plain
        case xml
    }
}
 
extension Activity {
    public enum ActivityType: String, Codable {
        case message
        case contactRelationUpdate
        case conversationUpdate
        case typing
        case endOfConversation
//        case event
//        case invoke
        case deleteUserData
        case messageUpdate
        case messageDelete
        case installationUpdate
        case messageReaction
        case suggestion
//        case trace
        case handoff
    }
}

extension Activity {
    public enum AttachmentLayout: String, Codable {
        case carousel
        case list
    }
}

extension Activity {
    /// Defines additional information to include in the message.
    /// An attachment may be a file (such as an image, audio, or video) or a rich card.
    /// A7100: Senders SHOULD NOT include both content and contentUrl fields in a single attachment.
    public struct Attachment: Codable {
        /// The content of the attachment.
        public let content: Content?
        /// The media type of the content in the attachment.
        public let contentType: String
        /// URL for the content of the attachment. Supported protocols are: HTTP, HTTPS, File, and Data.
        public let contentUrl: URL?
        /// Name of the attachment
        public let name: String?
        /// URL to a thumbnail image that the channel can use if it supports using an alternative, smaller form of content or contentUrl.
        public let thumbnailUrl: URL?
        
        public init(_ url: URL, contentType: String, name: String?, thumbnailUrl: URL?) {
            self.content = nil
            self.contentType = contentType
            self.contentUrl = url
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: AdaptiveCard, name: String?, thumbnailUrl: URL?) {
            self.content = .adaptive(card)
            self.contentType = "application/vnd.microsoft.card.adaptive"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: ListCard, name: String?, thumbnailUrl: URL?) {
            self.content = .list(card)
            self.contentType = "application/vnd.microsoft.card.list"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: O365ConnectorCard, name: String?, thumbnailUrl: URL?) {
            self.content = .o365(card)
            self.contentType = "application/vnd.microsoft.card.o365connector"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: AnimationCard, name: String?, thumbnailUrl: URL?) {
            self.content = .animation(card)
            self.contentType = "application/vnd.microsoft.card.animation"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: AudioCard, name: String?, thumbnailUrl: URL?) {
            self.content = .audio(card)
            self.contentType = "application/vnd.microsoft.card.audio"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: HeroCard, name: String?, thumbnailUrl: URL?) {
            self.content = .hero(card)
            self.contentType = "application/vnd.microsoft.card.hero"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: ReceiptCard, name: String?, thumbnailUrl: URL?) {
            self.content = .receipt(card)
            self.contentType = "application/vnd.microsoft.card.receipt"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: SignInCard, name: String?, thumbnailUrl: URL?) {
            self.content = .signIn(card)
            self.contentType = "application/vnd.microsoft.card.signin"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: ThumbnailCard, name: String?, thumbnailUrl: URL?) {
            self.content = .thumbnail(card)
            self.contentType = "application/vnd.microsoft.card.thumbnail"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        public init(_ card: VideoCard, name: String?, thumbnailUrl: URL?) {
            self.content = .video(card)
            self.contentType = "application/vnd.microsoft.card.video"
            self.contentUrl = nil
            self.name = name
            self.thumbnailUrl = thumbnailUrl
        }
        
        enum CodingKeys: String, CodingKey {
            case content
            case contentType
            case contentUrl
            case name
            case thumbnailUrl
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let contentType = try container.decode(String.self, forKey: .contentType)
            if let url = try container.decodeIfPresent(URL.self, forKey: .contentUrl) {
                self.contentUrl = url
                self.content = nil
            } else {
                switch contentType {
                case "application/vnd.microsoft.card.adaptive":
                    self.content = .adaptive(try container.decode(AdaptiveCard.self, forKey: .content))
                case "application/vnd.microsoft.teams.card.o365connector":
                    self.content = .o365(try container.decode(O365ConnectorCard.self, forKey: .content))
                case "application/vnd.microsoft.teams.card.list":
                    self.content = .list(try container.decode(ListCard.self, forKey: .content))
                case "application/vnd.microsoft.card.animation":
                    self.content = .animation(try container.decode(AnimationCard.self, forKey: .content))
                case "application/vnd.microsoft.card.audio":
                    self.content = .audio(try container.decode(AudioCard.self, forKey: .content))
                case "application/vnd.microsoft.card.hero":
                    self.content = .hero(try container.decode(HeroCard.self, forKey: .content))
                case "application/vnd.microsoft.card.receipt":
                    self.content = .receipt(try container.decode(ReceiptCard.self, forKey: .content))
                case "application/vnd.microsoft.card.signin":
                    self.content = .signIn(try container.decode(SignInCard.self, forKey: .content))
                case "application/vnd.microsoft.card.thumbnail":
                    self.content = .thumbnail(try container.decode(ThumbnailCard.self, forKey: .content))
                case "application/vnd.microsoft.card.video":
                    self.content = .video(try container.decode(VideoCard.self, forKey: .content))
                default:
                    self.content = .other(try container.decode(String.self, forKey: .content))
                }
                self.contentUrl = nil
            }
            self.contentType = contentType
            self.name = try container.decodeIfPresent(String.self, forKey: .name)
            self.thumbnailUrl = try container.decodeIfPresent(URL.self, forKey: .thumbnailUrl)
        }

        public enum Content: Encodable {
            case other(String)
            case o365(O365ConnectorCard)
            case list(ListCard)
            case adaptive(AdaptiveCard)
            case animation(AnimationCard)
            case audio(AudioCard)
            case hero(HeroCard)
            case receipt(ReceiptCard)
            case signIn(SignInCard)
            case thumbnail(ThumbnailCard)
            case video(VideoCard)
            
            public func encode(to encoder: Encoder) throws {
                var container = encoder.unkeyedContainer()
                switch self {
                case .other(let content): try container.encode(content)
                case .o365(let content): try container.encode(content)
                case .list(let content): try container.encode(content)
                case .adaptive(let content): try container.encode(content)
                case .animation(let content): try container.encode(content)
                case .audio(let content): try container.encode(content)
                case .hero(let content): try container.encode(content)
                case .receipt(let content): try container.encode(content)
                case .signIn(let content): try container.encode(content)
                case .thumbnail(let content): try container.encode(content)
                case .video(let content): try container.encode(content)
                }
            }
        }
    }
}

extension Activity {
    /// Refers to a substring of content within another field.
    public struct TextHighlight: Codable {
        /// Occurrence of the text field within the referenced text, if multiple exist.
        public let occurrence: Int
        /// Defines the snippet of text to highlight.
        public let text: String
        
        public init(text: String, occurrence: Int = 0) {
            self.text = text
            self.occurrence = occurrence
        }
    }
}

extension Activity {
    /// Defines the options from which a user can choose.
    public struct SuggestedActions: Codable {
        /// Array of CardAction objects that define the suggested actions.
        public let actions: [CardAction]
        /// Array of strings that contains the IDs of the recipients to whom the suggested actions should be displayed.
        public let to: [String]
        
        public init(actions: [CardAction], to: [String]) {
            self.actions = actions
            self.to = to
        }
    }
}

extension Activity {
    /// Defines a reference to a programmatic action.
    public struct SemanticAction: Codable {
        /// An object where the value of each property is an Entity object.
        public let entities: [String: Entity]
        /// ID of this action.
        public let id: String
        /// State of this action.
        /// Allowed values: start, continue, done.
        public let state: State
        
        public init(id: String, entities: [String: Entity], state: State) {
            self.id = id
            self.entities = entities
            self.state = state
        }
        
        public enum State: String, Codable {
            case start
            case `continue`
            case done
        }
    }
}

extension Activity {
    /// Defines a reaction to a message.
    public struct MessageReaction: Codable {
        /// Type of reaction.
        public let type: String
        
        public init(type: String) {
            self.type = type
        }
    }
}
