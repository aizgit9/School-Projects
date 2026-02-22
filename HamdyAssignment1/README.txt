Name: Asher Isgitt
NetID: dal167894
Section: 501

IMPLEMENTATION CHOICES

BrowserArrayList:
Even though it wasn't strictly necessary, I included an addFront method in the class to enhance my understanding of
circular arrays. I chose to double the size of the array in every resize call for simplicity. I included get and
set methods. I also chose to fully null out the array in the clear method to prevent memory leaks. I kept a modification
count to prevent errors from changing the list during iteration. I added a popFront method as well. All other details
are fairly standard.

BrowserLinkedList:
I added addBack and addFront methods. I included get and set methods. I kept a modification count to prevent errors 
from changing the list during iteration. I added a basic iterator even though it wasn't absolutely needed. I implemented 
the custom StackIterator as a nested class in the BrowserLinkedList class. All other details are fairly standard.

BrowserStack and BrowserQueue:
I kept these fairly minimal, they are both wrappers of their respective underlying data structures. The most notable thing
is that the BrowserStack returns the StackIterator from its parent instead of the basic list iterator. Trying to pop from
an empty stack will throw an EmptyStackException, as requested.

BrowserNavigation:
I chose to add an openWebpage method that opens the URL on your default browser. I used a text file (savestate.txt) to save the browsing
data from each session. For all of the methods, I followed the provided guidelines, using two stacks to store the forward and
backwards history and using a queue to store the full history. I used BufferedReader and BufferedWriter to read and write from
the save file. I made custom parsing methods to load the browsing data from the save file.

Main:
To test the browser navigation, I made a simple command line interface that allows the user to visit urls and browse back and forth.
When the user exits the program, all data is saved and ready to be reloaded in the next session. I wanted this system to be as user
friendly as possible, so I included a help function that displays all the commands.
I also built a simple testing function that stress tests the basic browser functions. It writes save data to a separate file to avoid
interference with user browsing. After testing, I verified the save file to ensure everything was working correctly.

Save files:
Stacks are saved in reverse to facilitate session restoration, using the custom StackIterator. There are two save files, one for
testing and one for user browsing sessions.

TIME COMPLEXITIES

BrowserArrayList:
clear - O(n)
addFront- O(1), O(n) if resized
addBack - O(1), O(n) if resized
popFront - O(1)
resizeArray - O(n)
get - O(1)
set - O(1)

BrowserLinkedList:
clear - O(1)
get - O(n)
set - O(n)
addFront - O(1)
addBack - O(1)
remove - O(n)

BrowserNavigation:
openWebpage - O(1)
visitWebsite - O(1)
goBack - O(1)
goForward - O(1)
showHistory - O(n)
clearHistory - O(n)
closeBrowser - O(n)
restoreLastSession - O(n)

BrowserQueue:
enqueue - O(1)
dequeue - O(1)
peek - O(1)
clear - O(n)

BrowserStack:
all operations are O(1)