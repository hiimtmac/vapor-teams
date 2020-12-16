import Foundation

/// An HMAC token.
public struct HMACAuthorization {
    /// The plaintext token
    public let token: String

    /// Create a new `HMACAuthorization`
    public init(token: String) {
        self.token = token
    }
}
