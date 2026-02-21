public class BrowserStack<AnyType> implements Iterable<AnyType>
{
    @SuppressWarnings("FieldMayBeFinal")
    private BrowserLinkedList<AnyType> stackList;

    public BrowserStack()
    {
        stackList = new BrowserLinkedList<>();
    }

    public void push(AnyType data)
    {
        stackList.addtoFront(data);
    }

    public AnyType pop()
    {
        if(isEmpty())
        {
            throw new java.util.EmptyStackException();
        }

        return stackList.remove(0);
    }

    public AnyType peek()
    {
        if(isEmpty())
        {
            throw new java.util.EmptyStackException();
        }

        return stackList.get(0);
    }

    public int size()
    {
        return stackList.size();
    }

    public boolean isEmpty()
    {
        return stackList.size() == 0;
    }

    public void clear()
    {
        stackList.clear();
    }

    @Override
    public java.util.Iterator<AnyType> iterator()
    {
        return stackList.stackIterator();
    }
}