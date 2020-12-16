import Foundation

/// Defines a card that lets a user sign in to a service.
public struct SignInCard: CardType {    
    /// Array of CardAction objects that enable the user to sign in to a service.
    /// The channel determines the number of buttons that you may specify.
    let buttons: [CardAction]
    /// Description or prompt to include on the sign in card.
    let text: String
}
