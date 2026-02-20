import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;

public class BrowserNavigation
{
    private BrowserQueue<String> historyQueue;
    private BrowserStack<String> backStack;
    private BrowserStack<String> forwardStack;
    private String currentPage;


    public boolean openWebpage(String urlString) {
        // Check if Desktop is supported on the current platform
        if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Desktop.Action.BROWSE)) {

            try
            {
                Desktop.getDesktop().browse(new URI(urlString));
            }
            catch(URISyntaxException | IOException e)
            {
                System.out.println("Failed to open web page with given URL.");
                return false;
            }
        } 
        else 
        {
            System.out.println("Desktop browsing is not supported on this platform.");
        }

        return true;
    }

    public BrowserNavigation()
    {
        historyQueue = new BrowserQueue<>();
        backStack = new BrowserStack<>();
        forwardStack = new BrowserStack<>();
        currentPage = null;
    }

    public void visitWebsite(String url)
    {
        if(currentPage != null)
        {
            backStack.push(currentPage);
        }  

        currentPage = url;

        historyQueue.enqueue(currentPage);
        forwardStack.clear();

        System.out.println("Now at [" + currentPage + "]");
        openWebpage(currentPage);
    }

    public void goBack()
    {
        forwardStack.push(currentPage);

        // Will throw an error if stack is empty (intended)
        currentPage = backStack.pop();
        System.out.println("Now at [" + currentPage + "]");
        openWebpage(currentPage);
    }

    public void goForward()
    {
        backStack.push(currentPage);

        // Will throw an error if stack is empty (intended)
        currentPage = forwardStack.pop();
        
        System.out.println("Now at [" + currentPage + "]");
        openWebpage(currentPage);
    }

    public void showHistory()
    {
        Iterator<String> it = historyQueue.iterator();

        while(it.hasNext())
        {
            System.out.println(it.next());
        }
    }

    public void clearHistory()
    {
        historyQueue.clear();
    }

    public void closeBrowser()
    {

    }

    public void restoreLastSession()
    {
        
    }
}