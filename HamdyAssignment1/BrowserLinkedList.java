
import java.util.NoSuchElementException;

public class BrowserLinkedList<AnyType> implements Iterable<AnyType>
{
    private static class Node<AnyType>
    {
        
        public Node(AnyType data, Node<AnyType> prev, Node<AnyType> next)
        {
            this.data = data;
            this.prev = prev;
            this.next = next;
        }

        public AnyType data;
        public Node<AnyType> prev;
        public Node<AnyType> next;
    }

    private Node<AnyType> head;
    private Node<AnyType> tail;
    private int theSize;
    private int modCount = 0;

    public BrowserLinkedList()
    {
        doClear();
    }

    private void doClear()
    {
        head = new Node<>(null, null, null);
        tail = new Node<>(null, head, null);
        head.next = tail;

        modCount++;

        theSize = 0;
    }

    public int size()
    {
        return theSize;
    }

    public void clear()
    {
        doClear();
    }

    public void add(int index, AnyType data)
    {
        addBefore(getNode(index), data);
    }

    public void remove(int index)
    {
        removeNode(getNode(index));
    }

    private void addBefore(Node<AnyType> p, AnyType data)
    {
        Node<AnyType> newNode = new Node<>(data, p.prev, p);

        p.prev.next = newNode;
        p.prev = newNode;

        theSize++;
    }

    private Node<AnyType> getNode(int index)
    {
        if(index < 0|| index > size())
        {
            throw new IndexOutOfBoundsException();
        }

        Node<AnyType> p;

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

    private class BrowserLinkedListIterator implements java.util.Iterator<AnyType>
    {
        private Node<AnyType> current;

        public BrowserLinkedListIterator()
        {
            current = head;
        }

        @Override
        public boolean hasNext()
        {
            return current.next != null;
        }
                
        @Override
        public AnyType next()
        {
            if(current.next == null)
            {
                throw new NoSuchElementException();
            }

            current = current.next;
            return current.prev.data;
        }

        //TO-DO: remove
    }
}