import Foundation
import TeamsKit

extension Attachment {
    static func hero() -> Self { .init(HeroCard.example()) }
    static func thumbnail() -> Self { .init(ThumbnailCard.example()) }
}
