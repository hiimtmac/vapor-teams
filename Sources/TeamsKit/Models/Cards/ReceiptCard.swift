import Foundation

/// Defines a card that contains a receipt for a purchase.
public struct ReceiptCard: CardType {
    /// Array of CardAction objects that enable the user to perform one or more actions.
    /// The channel determines the number of buttons that you may specify.
    let buttons: [CardAction]
    /// Array of Fact objects that specify information about the purchase.
    /// For example, the list of facts for a hotel stay receipt might include the check-in date and check-out date.
    /// The channel determines the number of facts that you may specify.
    let facts: [Fact]
    /// Array of ReceiptItem objects that specify the purchased items
    let items: [ReceiptItem]
    /// A CardAction object that specifies the action to perform if the user taps or clicks the card.
    /// This can be the same action as one of the buttons or a different action.
    let tap: CardAction
    /// A currency-formatted string that specifies the amount of tax applied to the purchase.
    let tax: String
    /// Title displayed at the top of the receipt.
    let title: String
    /// A currency-formatted string that specifies the total purchase price, including all applicable taxes.
    let total: String
    /// A currency-formatted string that specifies the amount of value-added tax (VAT) applied to the purchase price.
    let vat: String
}

extension ReceiptCard {
    /// Defines a key-value pair that contains a fact.
    public struct Fact: Codable {
        /// Name of the fact. For example, Check-in.
        /// The key is used as a label when displaying the fact's value.
        public let key: String
        /// Value of the fact. For example, 10 October 2016.
        public let value: String
        
        public init(key: String, value: String) {
            self.key = key
            self.value = value
        }
    }
}

extension ReceiptCard {
    /// Defines a line item within a receipt.
    public struct ReceiptItem: Codable {
        /// A CardImage object that specifies thumbnail image to display next to the line item.
        public let image: CardImage
        /// A currency-formatted string that specifies the total price of all units purchased.
        public let price: String
        /// A numeric string that specifies the number of units purchased.
        public let quantity: String
        /// Subtitle to be displayed under the line item's title.
        public let subtitle: String
        /// A CardAction object that specifies the action to perform if the user taps or clicks the line item.
        public let tap: CardAction
        /// Description of the line item.
        public let text: String
        /// Title of the line item.
        public let title: String
    }
}
