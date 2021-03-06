protocol Element: class, PositionedElement {
    var text: String { get }
    var children: [Element] { get }
    var file: File? { get set }
    weak var parent: Element? { get set }
    func accept(_ visitor: ElementVisitor)
}
