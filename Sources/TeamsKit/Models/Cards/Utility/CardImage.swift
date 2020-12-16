import Foundation

public struct CardImage: Codable {
    /// Description of the image.
    /// You should include the description to support accessibility.
    public let alt: String?
    /// A CardAction object that specifies the action to perform if the user taps or clicks the image.
    public let tap: CardAction?
    /// URL to the source of the image or the base64 binary of the image (for example, data:image/png;base64,iVBORw0KGgo...).
    public let url: URLSource
    
    public init(url: URLSource, alt: String?, tap: CardAction?) {
        self.alt = alt
        self.tap = tap
        self.url = url
    }
}
