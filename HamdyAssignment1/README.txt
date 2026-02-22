Name: Asher Isgitt
NetID: dal167894
Section: 501
Professor: Omar Hamdy
Date: 2/21/2026

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
the save file. I made custom parsing methods to load the browsing data from the save file. I added a toggle for the openWebPage method
to make extensive testing possible.

Main:
To test the browser navigation, I made a simple command line interface that allows the user to visit urls and browse back and forth.
When the user exits the program, all data is saved and ready to be reloaded in the next session. I wanted this system to be as user
friendly as possible, so I included a help function that displays all the commands.
I also built a simple testing function that stress tests the basic browser functions. It writes save data to a separate file to avoid
interference with user browsing. After testing, I verified the save file to ensure everything was ordered correctly. 

Save files:
Stacks are saved in reverse to facilitate session restoration, using the custom StackIterator. There are two save files, one for
testing and one for user browsing sessions.

TIME COMPLEXITIES

BrowserArrayList:
clear - O(n) 
Clearing the array while preventing memory leaks requires looping through and nulling out the array in linear time.
addFront - O(1), O(n) if resized. 
The circular array structure allows addFront to run in constant time. This is because items are wrapped around the end of the array.
However, if a resize is needed, time goes up to O(n)
addBack - O(1), O(n) if resized
The circular array structure allows addBack to run in constant time. This is only one value has to be overwritten.
However, if a resize is needed, time goes up to O(n)
popFront - O(1)
It runs in constant time because this operation is essentially just moving the front pointer to an adjacent position.
resizeArray - O(n)
Resizing the array requires looping through the array and copying, taking linear time.
get - O(1)
Getting is a simple indexed access and is a constant time operation.
set - O(1)
Setting is a simple indexed overwrite and is a constant time operation.

BrowserLinkedList:
clear - O(1)
Clearing happens in constant time because only only the head and tail pointers have to be nulled out to send the entire list to
garbage collection.
get - O(n)
Get is in linear time because the program has to search through every node to get to the correct index. 
set - O(n)
Set is also in linear time because the program has to search through every node to get to the correct index.
addFront - O(1)
AddFront happens in constant time because it only requires a simple rewiring of pointers
addBack - O(1)
AddBack happens in constant time because it only requires a simple rewiring of pointers
remove - O(n)
The linear time in remove comes from searching through every node to get to the correct index. The actual remove operation happens
in constant time, because it is only a simple rewiring of pointers.

BrowserNavigation:
openWebpage - O(1)
This function has no loops and is made up of constant time operations.
visitWebsite - O(1)
This function has no loops and is made up of constant time operations.
goBack - O(1)
This function uses O(1) operations on stacks and queues, so it only takes constant time.
goForward - O(1)
This function uses O(1) operations on stacks and queues, so it only takes constant time.
showHistory - O(n)
This function iterates through a queue, requiring linear time to print everything in the history.
clearHistory - O(n) 
This function involves clearing the underlying arrayList in a queue, which takes linear time.
closeBrowser - O(n)
This function iterates through both stacks and a queue to save the browser state, so it takes linear time.
restoreLastSession - O(n)
This function iterates through a file to load a saved browser state, so it takes linear time.

BrowserQueue:
enqueue - O(1)
The circular array structure allows addBack to run in constant time. This is only one value has to be overwritten.
dequeue - O(1)
It runs in constant time because this operation is essentially just moving the front pointer to an adjacent position.
peek - O(1)
Getting is a simple indexed access and is a constant time operation.
clear - O(n)
Clearing the array while preventing memory leaks requires looping through and nulling out the array in linear time.

BrowserStack:
push - O(1)
AddFront happens in constant time because it only requires a simple rewiring of pointers
pop - O(1)
The actual remove operation happens in constant time, because it is only a simple rewiring of pointers. Even though
the underlying function in the linkedList has a linear search, the pop always happens at index 0 so it is irrelevant.
peek - O(1)
Get is usually in linear time because the program has to search through every node to get to the correct index. Even though
the underlying function in the linkedList has a linear search, the peek always happens at index 0 so it is irrelevant.
clear - O(1)
Clearing happens in constant time because only only the head and tail pointers have to be nulled out to send the entire list to
garbage collection.