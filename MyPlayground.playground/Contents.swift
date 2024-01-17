example(of: "creating nodes") {
    let node1 = Node(value:1)
    let node2 = Node(value:2)
    let node3 = Node(value:3)

    node1.next = node2
    node2.next = node3

    print(node1)
}

example(of: "push") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print(list)
}

example(of: "append") {
    var list = LinkedList<Int>()
    list.append(1)
    list.append(2)
    list.append(3)
    print(list)
}

example(of: "inserting at a point") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)

    print("before inserting: \(list)")

    var middle = list.node(at: 1)!
    for _ in 1...4 {

        middle = list.insert(-1, after: middle)

    }

    print("after inserting: \(list)")
    print("inserting tail")
    list.insert(3, after: list.tail!)
    print("after inserting tail : \(list)")
    print("inserting tail")
    list.insert(3, after: list.tail!)
    print("after inserting: \(list)")

}

example(of: "pop") {

    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("before popping : \(list)")
    let popped = list.pop()
    print("after popping : \(list)")
    let popped2 = list.pop()
    print("after popping : \(list)")
    let popped3 = list.pop()
    print("after popping : \(list)")
    print("popped " + String(String(describing: popped)))
    print("popped2 " + String(String(describing: popped2)))
    print("popped3 " + String(String(describing: popped3)))

}


example(of: "removing last") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("before removing last : \(list)")
    let removed = list.removeLast()
    print("after removing last : \(list)")
    print("removed : "+String(String(describing: removed)))

}
