import Vapor

extension HTTPHeaders {
    /// Access or set the `X-Correlating-OperationId: ...` header.
    public var correlatingOperationId: String? {
        get {
            self.first(name: .correlatingOperationId)
        }
        set {
            if let operationId = newValue {
                replaceOrAdd(name: .correlatingOperationId, value: operationId)
            } else {
                remove(name: .correlatingOperationId)
            }
        }
    }
}

extension HTTPHeaders.Name {
    static let correlatingOperationId = HTTPHeaders.Name("X-Correlating-OperationId")
}
