import Vapor
import TeamsKit

public struct OutgoingWebhookAuthenticator: HMACAuthenticator {
    public let secretKey: String
    
    public init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    public func authenticate(hmac: HMACAuthorization, for request: Request) -> EventLoopFuture<Void> {
        guard let buffer = request.body.data else {
            return request.eventLoop.makeFailedFuture(Abort(.badRequest, reason: "Missing body"))
        }
        
        do {
            try Data(buffer: buffer).validate(
                code: hmac.token,
                withSecret: secretKey
            )
            
            return request.eventLoop.makeSucceededFuture(())
        } catch {
            return request.eventLoop.makeFailedFuture(error)
        }
    }
}

extension Data.ValidationError: AbortError {
    public var status: HTTPResponseStatus {
        switch self {
        case .secretKey: return .internalServerError
        case .mismatchedSignature: return .unauthorized
        }
    }
    
    public var reason: String { localizedDescription }
}
