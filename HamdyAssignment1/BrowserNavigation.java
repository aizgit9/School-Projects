import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
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
        //openWebpage(currentPage);
    }

    public void goBack()
    {
        forwardStack.push(currentPage);

        // Will throw an error if stack is empty (intended)
        currentPage = backStack.pop();
        System.out.println("Now at [" + currentPage + "]");
        //openWebpage(currentPage);
    }

    public void goForward()
    {
        backStack.push(currentPage);

        // Will throw an error if stack is empty (intended)
        currentPage = forwardStack.pop();
        
        System.out.println("Now at [" + currentPage + "]");
        //openWebpage(currentPage);
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
        backStack.clear();
        forwardStack.clear();
        currentPage = null;
    }

    public void closeBrowser()
    {
        String fileName = "savestate.txt";
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(fileName)))
        {
            writer.write("currentPage");
            writer.newLine();
            writer.write(currentPage);
            writer.newLine();

            writer.write("backStack");
            writer.newLine();
            for (String url : backStack) {
                writer.write(url);
                writer.newLine();
            }

            writer.write("forwardStack");
            writer.newLine();
            for (String url : forwardStack) {
                writer.write(url);
                writer.newLine();
            }

            writer.write("historyQueue");
            writer.newLine();
            for (String url : historyQueue) {
                writer.write(url);
                writer.newLine();
            }
        }
        catch(IOException e)
        {
            System.out.println("Error: could not write to file");
        }
    }

    public void restoreLastSession()
    {
        String fileName = "savestate.txt";
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) 
        {
            String line;
            int stateTracker = 0;
            while ((line = reader.readLine()) != null) 
            {
                switch (line) {
                    case "currentPage" -> 
                    {
                        stateTracker = 0;
                        continue;
                    }
                    case "backStack" -> 
                    {
                        stateTracker = 1;
                        continue;
                    }
                    case "forwardStack" -> 
                    {
                        stateTracker = 2;
                        continue;
                    }
                    case "historyQueue" ->
                    {
                        stateTracker = 3;
                        continue;
                    }
                }

                switch (stateTracker) {
                    case 0 -> 
                    {
                        currentPage = line;
                    }
                    case 1 -> 
                    {
                        backStack.push(line);
                    }
                    case 2 -> 
                    {
                        forwardStack.push(line);
                    }
                    case 3 -> 
                    {
                        historyQueue.enqueue(line);
                    }
                }
            }
        } 
        catch (IOException e) 
        {
            System.out.println("Error: could not read from file");
        }

        if (currentPage != null)
        {
            System.out.println("Now at [" + currentPage + "]");
        }
    }
}