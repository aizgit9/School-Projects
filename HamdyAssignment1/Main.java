/*
File Name:  Main.java
Date:       2/21/2026
Author:     Asher Isgitt
Purpose:    Driver program that runs and tests the browser navigation system
*/

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        handleBrowserInteraction();
        testBrowserNavigator();
    }

    // Main driver for browsing
    public static void handleBrowserInteraction() {

        Scanner reader = new Scanner(System.in);

        BrowserNavigation navigator = new BrowserNavigation();

        System.out.println("Browser interaction testing active. Type 'help' for a list of commands.");
        System.out.println(navigator.restoreLastSession("savestate.txt"));

        // User Interaction Loop
        OUTER:
        while (true) {
            String input = reader.nextLine();
            if(input.startsWith("visit "))
            {
                String url = input.substring(6);

                System.out.println(navigator.visitWebsite(url));
                continue;
            }

            // Main command switch statement
            switch (input) 
            {
                case "exit" -> 
                {
                    navigator.closeBrowser("savestate.txt");
                    break OUTER;
                }
                case "back" -> 
                {
                    System.out.println(navigator.goBack());
                }
                case "forward" -> 
                {
                     System.out.println(navigator.goForward());
                }
                case "show history" -> 
                {
                    navigator.showHistory();
                }
                case "clear history" -> 
                {
                    navigator.clearHistory();
                }
                case "toggle wpo" -> 
                {
                    System.out.println(navigator.toggleWebpageOpen());
                }
                case "help" -> {
                    // Helper command that outputs all possible inputs
                    System.out.println("COMMANDS:");
                    System.out.println("visit <url>         Navigates to the web page at <url>.");
                    System.out.println("exit                Closes the browser and saves browser state.");
                    System.out.println("back                Navigates to the previous web page.");
                    System.out.println("forward             Navigates to the next web page.");
                    System.out.println("show history        Displays browsing history");
                    System.out.println("clear history       Clears all browsing history.");
                    System.out.println("toggle wpo          Toggles web page opening.");
                }
                default -> System.out.println("Invalid input. Try again!");
            }
        }
        
        reader.close();
    }

    // Tests basic browser functions
    public static void testBrowserNavigator() {
        BrowserNavigation testNavigator = new BrowserNavigation();
        testNavigator.clearHistory();

        System.out.println("Running test cases...");
        // Critical to prevent computer slowdown, disables opening webpages in the browser
        System.out.println(testNavigator.toggleWebpageOpen());
        // Visit 500 times
        for (int i = 0; i < 500; i++) {
            testNavigator.visitWebsite(i + "");
        }

        // Go back 250 times
        for (int i = 0; i < 250; i++) {
            testNavigator.goBack();
        }

        // Go forward 100 times
        for (int i = 0; i < 100; i++) {
            testNavigator.goForward();
        }

        // Test closing and reloading
        testNavigator.closeBrowser("testsavestate.txt");
        testNavigator.restoreLastSession("testsavestate.txt");
        testNavigator.closeBrowser("testsavestate.txt");

        System.out.println("Test cases complete! Check test save file to verify correct behavior.");
    }
}