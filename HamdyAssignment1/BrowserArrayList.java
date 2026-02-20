import java.util.ConcurrentModificationException;

// List implementation using a circular array
public class BrowserArrayList<AnyType> implements Iterable<AnyType>
{
    private AnyType[] theItems;
    private int front;
    private int back;
    private int theSize;

    private int modCount = 0;

    public BrowserArrayList()
    {
        theItems = (AnyType[]) new Object[10];
         
        front = 0;
        back = 0;
        theSize = 0;
    }

    // Appends an item to the front of the array
    public void addToFront(AnyType item)
    {
        if(theSize == theItems.length)
        {
            resizeArray();
        }

        if(--front < 0)
        {
            front = theItems.length - 1;
        }

        theItems[front] = item;
        theSize++;
        modCount++;
    }

    // Appends an item to the back of the array
    public void addToBack(AnyType item)
    {
        if(theSize == theItems.length)
        {
            resizeArray();
        }

        theItems[back] = item;
        back++;
        theSize++;
        modCount++;
    }

    // Remove and return front item
    public AnyType popFromFront()
    {
        int oldFront = front;
        front++;
        theSize--;
        modCount++;
        return theItems[oldFront];
    }

    /*
    Creates an array double the size of the previous array
    Copies all the items from the old array into the new one
    */ 
    private void resizeArray()
    {
        AnyType[] newItems = (AnyType[]) new Object[theItems.length * 2];

        theSize = 0;

        // Loop from front to back and copies items in order
        for(int i = front; i < back; i++) 
        {
            newItems[i] = theItems[i];
            theSize++;
        }

        theItems = newItems;
        
        front = 0;
        back = theSize;

        modCount++;
    }

    // Returns the item at logicalIndex
    public AnyType get(int logicalIndex)
    {
        if(logicalIndex < 0 || logicalIndex > size() - 1)
        {
            throw new ArrayIndexOutOfBoundsException();
        }

        return theItems[getPhysicalIndex(logicalIndex)];
    }

    // Overwrites the item at logicalIndex with newItem
    public AnyType set(int logicalIndex, AnyType newItem)
    {
        AnyType oldItem = theItems[getPhysicalIndex(logicalIndex)];

        theItems[getPhysicalIndex(logicalIndex)] = newItem;

        return oldItem;
    }

    /* 
    Convert external logical index into actual array index
    Allows for easy indexing
    */
    private int getPhysicalIndex(int logicalIndex)
    {
        return (front + logicalIndex) % theItems.length;
    }

    // Returns theSize
    public int size()
    {
        return theSize;
    }

    @Override
    public java.util.Iterator<AnyType> iterator()
    {
        return new BrowserArrayListIterator();
    }

    /* 
    Iterator used to traverse the list
    !! Do not initialize until all modifications have been completed !!
    */
    private class BrowserArrayListIterator implements java.util.Iterator<AnyType>
    {   
        int current;
        @SuppressWarnings("FieldMayBeFinal")
        private int expectedModCount; 

        public BrowserArrayListIterator()
        {
            current = front;
            expectedModCount = modCount;
        }

        // Checks if current is at the end of the list
        @Override
        public boolean hasNext()
        {
            if (expectedModCount != modCount)
            {
                throw new ConcurrentModificationException();
            }

            return current < back;
        }

        // Returns the current item and moves current to the next index
        @Override
        public AnyType next()
        {
            if (expectedModCount != modCount)
            {
                throw new ConcurrentModificationException();
            }

            int old = current;

            current++;

            return theItems[old];
        }

        // TO-DO: remove()
    }
}