import Vapor

enum Env: String {
    case WEBHOOK_SECRET
    case INCOMING_WEBHOOK
}

extension Environment {
    static func get(_ key: Env) -> String {
        guard let value = get(key.rawValue) else {
            fatalError("No \(key.rawValue) in env")
        }
        
        return value
    }
}
