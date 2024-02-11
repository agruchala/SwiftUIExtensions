import SwiftUI
/// Enum representing common padding values.
public enum CommonPadding: CGFloat, CaseIterable {
    case zero = 0
    case two = 2
    case four = 4
    case eight = 8
    case sixteen = 16
    case thirtyTwo = 32
    case sixtyFour = 64
}

public extension View {
    /// Applies a frame with the specified width, height, and alignment.
    /// - Parameters:
    ///   - width: The width of the frame.
    ///   - height: The height of the frame.
    ///   - alignment: The alignment of the view within the frame.
    /// - Returns: A view with the specified frame.
    func frame(width: CommonPadding? = nil, height: CommonPadding? = nil, alignment: Alignment = .center) -> some View{
        frame(width: width?.rawValue, height: height?.rawValue, alignment: alignment)
    }
    
    /// Applies a corner radius with the specified radius and antialiased setting.
    /// - Parameters:
    ///   - radius: The radius of the corner.
    ///   - antialiased: A Boolean value that determines whether the corner is antialiased.
    /// - Returns: A view with the specified corner radius.
    func cornerRadius(_ radius: CommonPadding, antialiased: Bool = true) -> some View {
        cornerRadius(radius.rawValue, antialiased: antialiased)
    }
    
    /// Applies padding to the view.
    /// - Parameters:
    ///   - edges: The edges to apply padding to.
    ///   - length: The amount of padding to apply.
    /// - Returns: A view with the specified padding.
    func padding(_ edges: Edge.Set = .all, _ length: CommonPadding?) -> some View {
        padding(edges, length?.rawValue)
    }
}

public extension HStack {
    /// Initializes a horizontal stack with the specified alignment, spacing, and content.
    /// - Parameters:
    ///   - alignment: The vertical alignment of the stack's content.
    ///   - spacing: The spacing between each stack element.
    ///   - content: A function builder that creates the contents of the stack.
    /// - Returns: A horizontal stack view.
    @_disfavoredOverload
    init(
        alignment: VerticalAlignment = .center,
        spacing: CommonPadding? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing?.rawValue,
            content: content
        )
    }
}

public extension VStack {
    /// Initializes a vertical stack with the specified alignment, spacing, and content.
    /// - Parameters:
    ///   - alignment: The horizontal alignment of the stack's content.
    ///   - spacing: The spacing between each stack element.
    ///   - content: A function builder that creates the contents of the stack.
    /// - Returns: A vertical stack view.
    @_disfavoredOverload
    init(
        alignment: HorizontalAlignment = .center,
        spacing: CommonPadding? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.init(
            alignment: alignment,
            spacing: spacing?.rawValue,
            content: content
        )
    }
}
