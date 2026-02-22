/*
File Name:  BrowserArrayList.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    List implementation using a doubly linked list
*/

import java.util.ConcurrentModificationException;
import java.util.NoSuchElementException;

public class BrowserLinkedList<AnyType> implements Iterable<AnyType>
{
    private Node<AnyType> head; // Pointer to the beginning of the list
    private Node<AnyType> tail; // Pointer to the end of the list
    private int theSize;
    private int modCount = 0; // Total amount of modifications to detect tampering

    // Default constructor
    public BrowserLinkedList() { doClear(); }

    // Returns the list size O(1)
    public int size() { return theSize; }

    // Public clear method O(1)
    public void clear() { doClear(); }

    // Removes references to head and tail, clearing the list O(1)
    private void doClear() {
        head = new Node<>(null, null, null);
        tail = new Node<>(null, head, null);
        head.next = tail;
        modCount++;
        theSize = 0;
    }

    // Overwrites the node at index data with new data  O(n)
    public AnyType set(int index, AnyType data) { return setNode(getNode(index), data); }

    // Overwrites p's data with new data  O(1)
    private AnyType setNode(Node<AnyType> p, AnyType data)
    {
        AnyType oldData = p.data;
        p.data = data;
        return oldData;

    }
    
    // Adds a node from data before tail  O(1)
    public void addBack(AnyType data) { addBefore(tail, data); }

    // Adds a node from data after head O(1)
    public void addFront(AnyType data) { addBefore(head.next, data); } 

    // Creates a new node from data before p O(1)
    private void addBefore(Node<AnyType> p, AnyType data) {
        Node<AnyType> newNode = new Node<>(data, p.prev, p);
        p.prev.next = newNode;
        p.prev = newNode;
        theSize++;
    }

    // Returns the data of the node at index O(n)
    public AnyType get(int index) { return getNode(index).data; }

    // Returns the node at index O(n)
    private Node<AnyType> getNode(int index)
    {
        if(index < 0 || index >= size())
        {
            throw new IndexOutOfBoundsException();
        }

        Node<AnyType> p;

        /*
        If the index is closer to the beginning than the end, start traversing forwards from the head
        Else, start traversing backwards from the tail
        */ 
        if(index < size() / 2)
        {
            p = head.next;
            for(int i = 0; i < index; i++)
            {
                p = p.next;
            }

        }
        else
        {
            p = tail;
            for (int i = size(); i > index; i--) 
            {  
                p = p.prev;
            }    
        }
        
        return p;
    }

    // Removes the node at index  O(n)
    public AnyType remove(int index) {
        Node<AnyType> nodeToRemove = getNode(index);
        AnyType removedData = nodeToRemove.data;
        removeNode(nodeToRemove);
        return removedData;
    }

    // Removes the node p O(1)
    private void removeNode(Node<AnyType> p) {
        p.prev.next = p.next; // Previous node skips p and points to p's next
        p.next.prev = p.prev; // Next node skips p and points back to p's prev
        theSize--;
        modCount++;
    }

    @Override
    public java.util.Iterator<AnyType> iterator() { return new BrowserLinkedListIterator(); }

    public java.util.Iterator<AnyType> stackIterator() { return new StackIterator(); }

    /* 
    Iterator used to traverse the list
    !! Do not initialize until all modifications have been completed !!
    */
    private class BrowserLinkedListIterator implements java.util.Iterator<AnyType> {
        private Node<AnyType> current; // Pointer to the node the iterator is looking at
        private int expectedModCount; // Used to store modCount at iterator initialization

        // Current starts at the first node
        public BrowserLinkedListIterator() {
            current = head.next;
            expectedModCount = modCount;
        }

        // Returns true if the next node is not null, false otherwise O(1)
        @Override
        public boolean hasNext() {
            if (expectedModCount != modCount) throw new ConcurrentModificationException();

            return current != tail;
        }
        
        // Returns the current data and moves current to the next node O(1)
        @Override
        public AnyType next() {
            if(current == null) throw new NoSuchElementException();

            if (expectedModCount != modCount) throw new ConcurrentModificationException();

            AnyType data = current.data;
            current = current.next;
            return data;
        }
    }

    /* 
    Iterates through the list from the bottom up
    Alternate iterator used to traverse the list
    !! Do not initialize until all modifications have been completed !!
    */
    private class StackIterator implements java.util.Iterator<AnyType> {   
        private Node<AnyType> current; // Pointer to the node the iterator is looking at
        private int expectedModCount; // Used to store modCount at iterator initialization

        // Current starts at the first node
        public StackIterator() {
            current = tail.prev;
            expectedModCount = modCount;
        }

        // Returns true if the next node is not null, false otherwise O(1)
        @Override
        public boolean hasNext() {
            if (expectedModCount != modCount) throw new ConcurrentModificationException(); // Checks for changes
            return current != head;
        }
        
        // Returns the current data and moves current to the next node O(1)
        @Override
        public AnyType next() {
            if(current == null) throw new NoSuchElementException();

            if (expectedModCount != modCount) throw new ConcurrentModificationException(); // Checks for changes
            
            AnyType data = current.data;
            current = current.prev;
            return data;
        }
    }

    // Basic object that makes up the linked list.
    private static class Node<AnyType>
    {
        public AnyType data; // Payload
        public Node<AnyType> prev; // Pointer to previous node
        public Node<AnyType> next; // Pointer to next node

        public Node(AnyType data, Node<AnyType> prev, Node<AnyType> next) {
            this.data = data;
            this.prev = prev;
            this.next = next;
        }
    }
}