import java.util.ConcurrentModificationException;
import java.util.NoSuchElementException;

public class BrowserLinkedList<AnyType> implements Iterable<AnyType>
{
    private Node<AnyType> head; // Pointer to the beginning of the list
    private Node<AnyType> tail; // Pointer to the end of the list
    private int theSize;
    private int modCount = 0; // Total amount of modifications to detect tampering

    public BrowserLinkedList()
    {
        doClear();
    }

    // Returns the list size
    public int size()
    {
        return theSize;
    }

    // Public clear method
    public void clear()
    {
        doClear();
    }

    // Removes references to head and tail, clearing the list
    private void doClear()
    {
        head = new Node<>(null, null, null);
        tail = new Node<>(null, head, null);
        head.next = tail;

        modCount++;

        theSize = 0;
    }

    // Overwrites the node at index data with new data
    public AnyType set(int index, AnyType data)
    {
        return setNode(getNode(index), data);
    }

    // Overwrites p's data with new data
    private AnyType setNode(Node<AnyType> p, AnyType data)
    {
        AnyType oldData = p.data;
        p.data = data;
        return oldData;

    }
    
    // Adds a node from data before tail
    public void addtoBack(AnyType data)
    {
        addBefore(getNode(size()), data);
    }

    // Adds a node from data after head
    public void addtoFront(AnyType data)
    {
        addBefore(head.next, data);
    } 

    // Creates a new node from data before p
    private void addBefore(Node<AnyType> p, AnyType data)
    {
        Node<AnyType> newNode = new Node<>(data, p.prev, p);

        p.prev.next = newNode;
        p.prev = newNode;

        theSize++;
    }

    // Returns the data of the node at index
    public AnyType get(int index)
    {
        return getNode(index).data;
    }

    // Returns the node at index
    private Node<AnyType> getNode(int index)
    {
        if(index < 0 || index > size())
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
            p = head;
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

    // Removes the node at index
    public void remove(int index)
    {
        removeNode(getNode(index));
    }

    // Removes the node p
    private void removeNode(Node<AnyType> p)
    {
        p.prev.next = null;
        p.next.prev = null;

        theSize--;
        modCount++;
    }

    @Override
    public java.util.Iterator<AnyType> iterator()
    {
        return new BrowserLinkedListIterator();
    }

    /* 
    Iterator used to traverse the list
    !! Do not initialize until all modifications have been completed !!
    */
    private class BrowserLinkedListIterator implements java.util.Iterator<AnyType>
    {
        
        private Node<AnyType> current; // Pointer to the node the iterator is looking at
        @SuppressWarnings("FieldMayBeFinal")
        private int expectedModCount; // Used to store modCount at iterator initialization

        // Current starts at the first node
        public BrowserLinkedListIterator()
        {
            current = head.next;
            expectedModCount = modCount;
        }

        // Returns true if the next node is not null, false otherwise
        @Override
        public boolean hasNext()
        {
            if (expectedModCount != modCount)
            {
                throw new ConcurrentModificationException();
            }

            return current.next != null;
        }
        
        // Returns the current data and moves current to the next node
        @Override
        public AnyType next()
        {
            if(current == null)
            {
                throw new NoSuchElementException();
            }

            if (expectedModCount != modCount)
            {
                throw new ConcurrentModificationException();
            }
            
            AnyType data = current.data;
            current = current.next;
            return data;
        }
    }

    // Basic object that makes up the linked list.
    private static class Node<AnyType>
    {
        public AnyType data; // Payload
        public Node<AnyType> prev; // Pointer to previous node
        public Node<AnyType> next; // Pointer to next node

        public Node(AnyType data, Node<AnyType> prev, Node<AnyType> next)
        {
            this.data = data;
            this.prev = prev;
            this.next = next;
        }
    }
}