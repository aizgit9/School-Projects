/*
File Name:  BrowserArrayList.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    List implementation using a circular array
*/

import java.util.ConcurrentModificationException;
import java.util.NoSuchElementException;

public class BrowserArrayList<AnyType> implements Iterable<AnyType>
{
    private AnyType[] theItems;
    private int front; // Points to the beginning of the list
    private int back; // Points to the end of the list
    private int theSize; // Stores list size

    private int modCount = 0; // Total amount of modifications to detect tampering

    public BrowserArrayList() {
        theItems = (AnyType[]) new Object[10]; 
        doClear();
    }

    // Public clear method O(n)
    public void clear() { doClear(); }

    // Fills array with null, sets front and back to 0 O(n)
    private void doClear() {
        /* 
        Full null fill to prevent memory leaks
        If you wanted maximum efficiency, you could take this out
        */ 
        for (int i = 0; i < theItems.length; i++) { theItems[i] = null; }
        theSize = 0;
        front = 0;
        back = 0;
        modCount++;
    }

    // Appends an item to the front of the array O(1), or O(n) if resize needed
    public void addFront(AnyType item) {
        if(size() == theItems.length) resizeArray();
        front--;
        if(front < 0) front = theItems.length - 1;
        theItems[front] = item;
        theSize++;
        modCount++;
    }

    // Appends an item to the back of the array O(1), or O(n) if resize needed
    public void addBack(AnyType item) {
        if(size() == theItems.length) resizeArray();
        theItems[back] = item;
        back = (back + 1) % theItems.length;
        theSize++;
        modCount++;
    }

    // Remove and return front item O(1)
    public AnyType popFront() {
        if (size() == 0) throw new NoSuchElementException();
    
        AnyType item = theItems[front];
        theItems[front] = null; // Clean up the reference
    
        front = (front + 1) % theItems.length; // Wrap the pointer
        theSize--;
        modCount++;
        return item;
    }

    /*
    Creates an array double the size of the previous array
    Copies all the items from the old array into the new one O(n)
    */ 
    private void resizeArray() {
        AnyType[] newItems = (AnyType[]) new Object[theItems.length * 2];

        // Loop from front to back and copies items in order
        for(int i = 0; i < size(); i++) {
            newItems[i] = get(i);
        }

        theItems = newItems;
        front = 0;
        back = theSize;

        modCount++;
    }

    // Returns the item at logicalIndex O(1)
    public AnyType get(int logicalIndex) {
        if(logicalIndex < 0 || logicalIndex >= size()) throw new ArrayIndexOutOfBoundsException();
        return theItems[getPhysicalIndex(logicalIndex)];
    }

    // Overwrites the item at logicalIndex with newItem O(1)
    public AnyType set(int logicalIndex, AnyType newItem) {
        AnyType oldItem = theItems[getPhysicalIndex(logicalIndex)];
        theItems[getPhysicalIndex(logicalIndex)] = newItem;
        return oldItem;
    }

    /* 
    Convert external logical index into actual array index
    Allows for easy indexing O(1)
    */
    private int getPhysicalIndex(int logicalIndex) { return (front + logicalIndex) % theItems.length; }

    // Returns theSize O(1)
    public int size() { return theSize; }

    @Override
    public java.util.Iterator<AnyType> iterator() { return new BrowserArrayListIterator(); }

    /* 
    Iterator used to traverse the list
    !! Do not initialize until all modifications have been completed !!
    */
    private class BrowserArrayListIterator implements java.util.Iterator<AnyType> {
        int current; // Current is a logical index   
        private int expectedModCount; // Used to store modCount at iterator initialization

        // Default constructor
        public BrowserArrayListIterator() {
            current = 0;
            expectedModCount = modCount;
        }

        // Checks if current is at the end of the list O(1)
        @Override
        public boolean hasNext() {
            if (expectedModCount != modCount) throw new ConcurrentModificationException(); // Checks for changes
            return current < size();
        }

        // Returns the current item and moves current to the next index O(1)
        @Override
        public AnyType next() {
            if(current >= size()) throw new NoSuchElementException();
            if (expectedModCount != modCount) throw new ConcurrentModificationException(); // Checks for changes

            return get(current++);
        }
    }
}