import Vapor

/// Helper for creating authentication middleware using the HMAC authorization header.
public protocol HMACAuthenticator: AsyncRequestAuthenticator {
    func authenticate(hmac: HMACAuthorization, for request: Request) throws
}

extension HMACAuthenticator {
    public func authenticate(request: Request) async throws {
        guard let hmacAuthorization = request.headers.hmacAuthorization else {
            throw Abort(.unauthorized, reason: "Missing authorization")
        }
        
        return try self.authenticate(hmac: hmacAuthorization, for: request)
    }
}
