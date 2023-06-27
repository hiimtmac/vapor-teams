import Vapor

extension HTTPHeaders {
    /// Access or set the `Authorization: HMAC ...` header.
    public var hmacAuthorization: HMACAuthorization? {
        get {
            guard let string = self.first(name: .authorization) else {
                return nil
            }

            let headerParts = string.split(separator: " ")
            guard headerParts.count == 2 else {
                return nil
            }
            guard headerParts[0] == "HMAC" else {
                return nil
            }
            return .init(token: String(headerParts[1]))
        }
        set {
            if let hmac = newValue {
                replaceOrAdd(name: .authorization, value: "HMAC \(hmac.token)")
            } else {
                remove(name: .authorization)
            }
        }
    }
}
