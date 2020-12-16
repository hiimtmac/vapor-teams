import Vapor

/// Helper for creating authentication middleware using the HMAC authorization header.
public protocol HMACAuthenticator: RequestAuthenticator {
    func authenticate(hmac: HMACAuthorization, for request: Request) -> EventLoopFuture<Void>
}

extension HMACAuthenticator {
    public func authenticate(request: Request) -> EventLoopFuture<Void> {
        guard let hmacAuthorization = request.headers.hmacAuthorization else {
            return request.eventLoop.makeSucceededFuture(())
        }
        return self.authenticate(hmac: hmacAuthorization, for: request)
    }
}
