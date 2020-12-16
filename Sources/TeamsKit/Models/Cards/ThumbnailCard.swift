import Foundation

/// Defines a card with a thumbnail image, title, text, and action buttons.
public struct ThumbnailCard: CardType {    
    /// Array of CardAction objects that enable the user to perform one or more actions.
    /// The channel determines the number of buttons that you may specify.
    let buttons: [CardAction]
    /// Array of CardImage objects that specify thumbnail images to display on the card.
    /// The channel determines the number of thumbnail images that you may specify.
    let images: [CardImage]
    /// Subtitle to display under the card's title.
    let subtitle: String
    /// A CardAction object that specifies the action to perform if the user taps or clicks the card.
    /// This can be the same action as one of the buttons or a different action.
    let tap: CardAction
    /// Description or prompt to display under the card's title or subtitle.
    let text: String
    /// Title of the card.
    let title: String
}
