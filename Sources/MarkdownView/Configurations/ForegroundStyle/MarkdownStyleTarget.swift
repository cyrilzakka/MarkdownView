import Foundation

@_documentation(visibility: internal)
public enum MarkdownStyleTarget {
    case h1, h2, h3, h4, h5, h6
    case codeBlock, blockQuote
    case tableHeader, tableBody
}
