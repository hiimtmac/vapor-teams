import Vapor
import TeamsKit

public final class TenantMiddleware: Middleware {
    
    public let tenant: ID
    
    public init(tenant: ID) {
        self.tenant = tenant
    }
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        request.eventLoop
            .submit {
                let body = try request.content.decode(TenantPayload.self)
                
                guard body.channelData.tenant == self.tenant else {
                    throw TenantError.wrongTenant
                }
            }
            .flatMap {
                next.respond(to: request)
            }
    }
    
    enum TenantError: Error, LocalizedError, AbortError {
        case wrongTenant
        
        var errorDescription: String? {
            switch self {
            case .wrongTenant: return ""
            }
        }
        
        var status: HTTPResponseStatus {
            switch self {
            case .wrongTenant: return .unauthorized
            }
        }
        
        var reason: String { errorDescription ?? "Tenant Error" }
    }
    
    struct TenantPayload: Codable {
        let channelData: TeamsChannelData
    }
}
