import java.util.Iterator;

public class Main
{
    public static void main(String[] args)
    {
        BrowserArrayList<Integer> arr = new BrowserArrayList<>();

        for (int i = 0; i < 20; i++) {
            arr.addToBack(i);
        }

        arr.popFromFront();
        arr.popFromFront();

        int item = arr.get(17);
        System.out.println(item);

        Iterator<Integer> it = arr.iterator();

        while(it.hasNext())
        {
            System.out.println(it.next());
        }




    }
}