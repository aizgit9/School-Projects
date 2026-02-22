/*
File Name:  BrowserArrayList.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    Stack implementation using a linked list
*/

public class BrowserStack<AnyType> implements Iterable<AnyType> {

    private BrowserLinkedList<AnyType> stackList; // Internal linked list

    // Defualt constructor
    public BrowserStack() { stackList = new BrowserLinkedList<>(); }

    // Pushes some data to the top of the stack O(1)
    public void push(AnyType data) { stackList.addFront(data); }

    // Pops some data from the top of the stack and returns it O(1)
    public AnyType pop() {
        if(isEmpty()) throw new java.util.EmptyStackException();
        return stackList.remove(0);
    }

    // Returns the data from the top of the stack O(1)
    public AnyType peek() {
        if(isEmpty()) throw new java.util.EmptyStackException();
        return stackList.get(0);
    }

    // Returns the size of the stack O(1)
    public int size() { return stackList.size(); }

    // Checks if the stack is empty O(1)
    public boolean isEmpty() { return stackList.size() == 0; }

    // Clears the stack O(1)
    public void clear() { stackList.clear(); }

    // Returns the special StackIterator 
    @Override
    public java.util.Iterator<AnyType> iterator() { return stackList.stackIterator(); }
}