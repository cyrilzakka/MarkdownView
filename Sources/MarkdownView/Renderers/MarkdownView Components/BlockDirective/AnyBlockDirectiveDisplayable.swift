import SwiftUI

/// A type-erasure for type conforms to `BlockDirectiveDisplayable`.
public struct AnyBlockDirectiveDisplayable: BlockDirectiveDisplayable {
    public typealias BlockDirectiveView = AnyView

    @ViewBuilder private let displayableClosure: ([BlockDirectiveArgument], String) -> AnyView

    init<D: BlockDirectiveDisplayable>(erasing blockDisplayable: D) {
        displayableClosure = { args, text in
            AnyView(blockDisplayable.makeView(arguments: args, text: text))
        }
    }

    public func makeView(arguments: [BlockDirectiveArgument], text: String) -> AnyView {
        displayableClosure(arguments, text)
    }
}
