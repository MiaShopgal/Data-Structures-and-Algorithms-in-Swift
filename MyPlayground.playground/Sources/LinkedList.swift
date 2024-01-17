public struct LinkedList<Value> {

    public var head: Node<Value>?
    public var tail: Node<Value>?

    public init() {
    }

    public var isEmpty: Bool {
        head == nil
    }

    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }

    public mutating func append(_ value: Value) {

        guard !isEmpty else {
            push(value)
            return
        }

        debugPrint("appending \(value)")

        debugPrint("before tails's next is \(String(describing: tail!.next))")
        tail!.next = Node(value: value)

        debugPrint("after tails's next is \(String(describing: tail!.next))")
        debugPrint("before tails is \(tail!)")
        tail = tail!.next
        debugPrint("after tails is \(tail!)")

    }

    public mutating func node(at index: Int) -> Node<Value>? {

        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {

            currentNode = currentNode!.next
            currentIndex += 1

        }

        return currentNode

    }

//    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {

        guard tail !== node else {

            debugPrint("appending in insert")
            append(value)
            return tail!
        }

        node.next = Node(value: value, next: node.next)

        debugPrint("returning insert node \(String(describing: node.next))")

        return node.next!

    }

    public mutating func pop() -> Value? {
        defer {
            debugPrint("starting in defer")
            head = head?.next
            if isEmpty {
                debugPrint("empty tail")
                tail = nil
            }
        }
        debugPrint("end of defer")
        return head?.value
    }

    public mutating func removeLast() -> Value? {
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var previous = head
        var current = head
        while let next = current.next {
            debugPrint("next is \(next)")
            debugPrint("before swapping previous \(previous), current :\(current)")
            previous = current
            current = next
            debugPrint("after swapping previous \(previous), current :\(current)")
        }
        previous.next = nil
        tail = previous
        return current.value
    }

    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

}

extension LinkedList: CustomStringConvertible {
    public var description: String {

        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
