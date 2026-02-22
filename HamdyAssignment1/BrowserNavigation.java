/*
File Name:  BrowserArrayList.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    Navigator class that uses queue and stack to simulate web browsing
*/

import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

public class BrowserNavigation {
    private BrowserQueue<String> historyQueue;
    private BrowserStack<String> backStack;
    private BrowserStack<String> forwardStack;
    private String currentPage;
    private boolean allowWebpageOpening = true;

    /* 
    Attempts to open the webpage from the given URL in the system default browser
    Returns a status message O(1)
    */
    public String openWebpage(String url) {
        if(allowWebpageOpening) {
            // Checks if Desktop browsing is supported on the platform
            if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Desktop.Action.BROWSE)) {

                // Tries to open the url on the default browser
                try { Desktop.getDesktop().browse(new URI(url)); }
                catch(URISyntaxException | IOException e) { return "Failed to open web page with given URL."; }
            } 
            else return "Desktop browsing is not supported on this platform.";

            return "Web page opened successfully!";
        }

        return "Web page opening disabled.";
    }

    // Enables and disables the openWebPage method, returns a status message
    public String toggleWebpageOpen() { 
        allowWebpageOpening = !allowWebpageOpening; 
        if(allowWebpageOpening) {
            return "Web pages will open in the default browser.";
        }
        return "Web page opening in the default browser is disabled for testing";
    }

    // Default constructor
    public BrowserNavigation() {
        historyQueue = new BrowserQueue<>();
        backStack = new BrowserStack<>();
        forwardStack = new BrowserStack<>();
        currentPage = null;
    }

    /*
    Moves the current page to url and saves old page on the backStack and historyQueue
    Returns a status message O(1)
    */
    public String visitWebsite(String url) {
        if(currentPage != null) backStack.push(currentPage);
        currentPage = url;

        historyQueue.enqueue(currentPage);
        forwardStack.clear();

        return "Now at [" + currentPage + "]\n" + openWebpage(currentPage);
    }

    /* 
    Pushes current page to forwardStack and moves to the top of the backStack
    Returns a status message O(1)
    */ 
    public String goBack() {
        forwardStack.push(currentPage);

        // Will throw an error if stack is empty
        currentPage = backStack.pop();


        return "Now at [" + currentPage + "]\n" + openWebpage(currentPage);
    }

    /*
    Pushes currentPage to backStack and moves to the top of the forwardStack
    Returns a status message O(1)
    */

    public String goForward() {
        backStack.push(currentPage);

        // Will throw an error if stack is empty
        currentPage = forwardStack.pop();
        
        return "Now at [" + currentPage + "]\n" + openWebpage(currentPage);
    }

    // Prints out everything in the historyQueue O(n)
    public void showHistory() {  
        for (Object item : historyQueue) {
            System.out.println(item);
        }
    }

    // Clears all saved data O(n)
    public void clearHistory() {   
        currentPage = null;
        historyQueue.clear();
        backStack.clear();
        forwardStack.clear();
    }

    /* 
    Tries to save all tracked data in the savestate file O(n)
    Clears stacks and queue
    */ 
    public void closeBrowser(String fileName) {
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {

            // Adds a section head and saves the current page
            if(currentPage != null) writer.write("currentPage\n" + currentPage +"\n");
            
            // Section header for easy parsing later
            writer.write("backStack\n");

            // Iterates through the backStack and saves all data
            for (String url : backStack) {
                writer.write(url + "\n");
            }

            // Section header for easy parsing later
            writer.write("forwardStack\n");

            // Iterates through the forwardStack and saves all data
            for (String url : forwardStack) {
                writer.write(url + "\n");
            }

            // Section header for easy parsing later
            writer.write("historyQueue\n");

            // Iterates through the historyQueue and saves all data
            for (String url : historyQueue) {
                writer.write(url + "\n");
            }
        }
        catch(IOException e) {
            System.out.println("Error: could not write to file");
        }
        clearHistory();
    }

    // Tries to load all saved data from file into memory, returns a status message O(n)
    public String restoreLastSession(String fileName) {

        // Try to read the file using BufferedReader
        try (BufferedReader reader = new BufferedReader(new FileReader(fileName))) {
            String line;
            int section = 0;

            // Main reading loop
            while ((line = reader.readLine()) != null) {
                
                /*
                Helper methods create a rudimentary state machine
                They categorize each line of the file and load it into the correct place
                */ 
                int newSection = updateSection(line, section);
                
                // Makes sure header labels are not read as URLs
                if(section != newSection) {
                    section = newSection;
                    continue;
                }
                parseLine(line, section);
            }
        }
        catch (IOException e) { return "Error: could not read from file"; }

        // The currentPage will be null if the user had no save data
        if (currentPage != null) { return ("Now at [" + currentPage + "]"); }

        // There is no currentPage
        return "";
    }

    // Helper method for restoreLastSession that updates what save data section the reader is in
    private int updateSection(String line, int section) {
        switch (line) {
            case "currentPage"  -> section = 0;
            case "backStack"    -> section = 1; 
            case "forwardStack" -> section = 2;
            case "historyQueue" -> section = 3;
        }
        return section;
    }

    // Helper method that writes the line data to the correct stack or queue
    private void parseLine(String line, int section) {
        switch (section) {
            case 0 -> currentPage = line;
            case 1 -> backStack.push(line);
            case 2 -> forwardStack.push(line);
            case 3 -> historyQueue.enqueue(line);
        }
    }
}