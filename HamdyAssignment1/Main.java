import java.util.Scanner;

public class Main
{
    public static void main(String[] args)
    {
        Scanner reader = new Scanner(System.in);

        BrowserNavigation navigator = new BrowserNavigation();

        System.out.println("Browser active. Type 'help' for a list of commands.");
        navigator.restoreLastSession();
        

        // User Interaction Loop
        OUTER:
        while (true) {
            String input = reader.nextLine();
            if(input.startsWith("visit "))
            {
                String url = input.substring(6);

                navigator.visitWebsite(url);
                continue;
            }

            switch (input) 
            {
                case "exit" -> 
                {
                    navigator.closeBrowser();
                    break OUTER;
                }
                case "back" -> 
                {
                    navigator.goBack();
                }
                case "forward" -> 
                {
                    navigator.goForward();
                }
                case "show history" -> 
                {
                    navigator.showHistory();
                }
                case "clear history" -> 
                {
                    navigator.clearHistory();
                }
                case "help" -> {
                    System.out.println("COMMANDS:");
                    System.out.println("visit <url>         Navigates to the web page at <url>.");
                    System.out.println("exit                Closes the browser and saves browser state.");
                    System.out.println("back                Navigates to the previous web page.");
                    System.out.println("forward             Navigates to the next web page.");
                    System.out.println("show history        Displays browsing history");
                    System.out.println("clear history       Clears all browsing history.");
                }
                default -> System.out.println("Invalid input. Try again!");
            }
        }
        
        reader.close();
    }
}