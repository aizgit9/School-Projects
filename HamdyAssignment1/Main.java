public class Main
{
    public static void main(String[] args)
    {
        BrowserLinkedList<Integer> testList = new BrowserLinkedList<>();

        testList.add(1);
        testList.add(3);
        testList.add(17);
        testList.add(89);
        testList.add(123);

        java.util.Iterator<Integer> testIt = testList.iterator();

        while(testIt.hasNext())
        {
            System.out.println(testIt.next());
        }
    }
}