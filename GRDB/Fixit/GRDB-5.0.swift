// Fixits for changes introduced by GRDB 5.0.0

#if SQLITE_HAS_CODEC
extension Configuration {
    @available(*, unavailable, message: "Use Database.usePassphrase(_:) in Configuration.prepareDatabase instead.")
    public var passphrase: String? {
        get { preconditionFailure() }
        set { preconditionFailure() }
    }
}
#endif

#if SQLITE_HAS_CODEC
extension DatabasePool {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}
#endif

#if SQLITE_HAS_CODEC
extension DatabaseQueue {
    @available(*, unavailable, message: "Use Database.changePassphrase(_:) instead")
    public func change(passphrase: String) throws { preconditionFailure() }
}
#endif

extension FetchRequest {
    @available(*, unavailable, message: "Use makePreparedRequest(_:forSingleResult:) instead")
    public func prepare(_ db: Database, forSingleResult singleResult: Bool)
        throws -> (SelectStatement, RowAdapter?)
    { preconditionFailure() }
}

extension AnyFetchRequest {
    @available(*, unavailable, message: "Define your own FetchRequest type instead.")
    public init(
        _ prepare: @escaping (Database, _ singleResult: Bool) throws -> (SelectStatement, RowAdapter?))
    { preconditionFailure() }
}

extension AssociationAggregate {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> AssociationAggregate<RowDecoder> { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> AssociationAggregate<RowDecoder> { preconditionFailure() }
}

extension SQLSpecificExpressible {
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ name: String) -> SQLSelectable { preconditionFailure() }
    
    @available(*, unavailable, renamed: "forKey(_:)")
    public func aliased(_ key: CodingKey) -> SQLSelectable { preconditionFailure() }
}

extension ValueObservation where Reducer == Void {
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingCount<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.RemoveDuplicates<ValueReducers.Fetch<Int>>>
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllValues<Request.RowDecoder>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.OneValue<Request.RowDecoder>>
        where Request.RowDecoder: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllOptionalValues<Request.RowDecoder._Wrapped>>
        where Request.RowDecoder: _OptionalProtocol,
        Request.RowDecoder._Wrapped: DatabaseValueConvertible
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllRecords<Request.RowDecoder>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request) ->
        ValueObservation<ValueReducers.OneRecord<Request.RowDecoder>>
        where Request.RowDecoder: FetchableRecord
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingAll<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.AllRows>
        where Request.RowDecoder == Row
    { preconditionFailure() }
    
    @available(*, unavailable, message: "Use ValueObservation.tracking(value:) instead")
    public static func trackingOne<Request: FetchRequest>(_ request: Request)
        -> ValueObservation<ValueReducers.OneRow>
        where Request.RowDecoder == Row
    { preconditionFailure() }
}

extension ValueObservation where Reducer: ValueReducer, Reducer.Value: Equatable {
    @available(*, unavailable, renamed: "removeDuplicates")
    public func distinctUntilChanged()
        -> ValueObservation<ValueReducers.RemoveDuplicates<Reducer>>
    { preconditionFailure() }
}

extension ValueReducer where Value: Equatable {
    @available(*, unavailable, renamed: "removeDuplicates")
    public func distinctUntilChanged() -> ValueReducers.RemoveDuplicates<Self> { preconditionFailure() }
}
