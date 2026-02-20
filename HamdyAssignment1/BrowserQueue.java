public class BrowserQueue<AnyType> implements Iterable<AnyType>
{
    @SuppressWarnings("FieldMayBeFinal")
    private BrowserArrayList<AnyType> queueList;

    public BrowserQueue()
    {
        queueList = new BrowserArrayList<>();
    }

    public void enqueue(AnyType item)
    {
        queueList.addToBack(item);
    }

    public AnyType dequeue()
    {
        return queueList.popFromFront();    
    }

    public AnyType peek()
    {
        return queueList.get(0);
    }

    public boolean isEmpty()
    {
        return queueList.size() == 0;
    }

    public int size()
    {
        return queueList.size();
    }

    public void clear()
    {
        queueList.clear();
    }

    @Override
    public java.util.Iterator<AnyType> iterator()
    {
        return queueList.iterator();
    }
}