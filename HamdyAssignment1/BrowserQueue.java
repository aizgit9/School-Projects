/*
File Name:  BrowserArrayList.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    Queue implementation using a circular array
*/

public class BrowserQueue<AnyType> implements Iterable<AnyType>
{
    private BrowserArrayList<AnyType> queueList; // Internal circular arrayList

    // Default constructor
    public BrowserQueue() { queueList = new BrowserArrayList<>(); }

    // Adds an item to the back of the queue O(1)
    public void enqueue(AnyType item) { queueList.addBack(item); }

    // Pops an item from the front of the queue and returns it O(1)
    public AnyType dequeue() { return queueList.popFront(); }

    // Returns the item from the front of the queue O(1)
    public AnyType peek() { return queueList.get(0); }

    // Checks if the queue is empty O(1)
    public boolean isEmpty() { return queueList.size() == 0; }

    // Returns the size of the queue O(1)
    public int size() { return queueList.size(); }

    // Clears the queue O(n)
    public void clear() { queueList.clear(); }

    // Returns the iterator
    @Override
    public java.util.Iterator<AnyType> iterator() { return queueList.iterator(); }
}