import Foundation

/// Defines a card that can play animated GIFs or short videos.
public struct AnimationCard: CardType {    
    /// Aspect ratio of thumbnail/media placeholder.
    /// Allowed values are "16:9" and "4:3".
    let aspect: AspectRatio
    /// Flag that indicates whether to replay the list of animated GIFs when the last one ends.
    /// Set this property to true to automatically replay the animation; otherwise, false.
    /// The default value is true.
    let autoloop: Bool
    /// Flag that indicates whether to automatically play the animation when the card is displayed.
    /// Set this property to true to automatically play the animation; otherwise, false.
    /// The default value is true.
    let autostart: Bool
    /// Array of CardAction objects that enable the user to perform one or more actions.
    /// The channel determines the number of buttons that you may specify.
    let buttons: [CardAction]
    /// The length of the media content, in ISO 8601 duration format.
    let duration: String
    /// A ThumbnailUrl object that specifies the image to display on the card.
    let image: ThumbnailUrl
    /// Array of MediaUrl objects.
    /// When this field contains more than one URL, each URL is an alternative format of the same content.
    let media: [MediaUrl]
    /// Flag that indicates whether the animation may be shared with others.
    /// Set this property to true if the animation may be shared; otherwise, false.
    /// The default value is true.
    let shareable: Bool
    /// Subtitle to display under the card's title.
    let subtitle: String
    /// Description or prompt to display under the card's title or subtitle.
    let text: String
    /// Title of the card.
    let title: String
    /// Supplementary parameter for this card.
//    let value: object
}
