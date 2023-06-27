import Vapor
import TeamsKit

public struct OutgoingWebhookAuthenticator: HMACAuthenticator {
    public let secretKey: String
    
    public init(secretKey: String) {
        self.secretKey = secretKey
    }
    
    public func authenticate(hmac: HMACAuthorization, for request: Request) throws {
        guard let buffer = request.body.data else {
            throw Abort(.badRequest, reason: "Missing body")
        }
        
        try Data(buffer: buffer).validate(
            code: hmac.token,
            withSecret: secretKey
        )
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
