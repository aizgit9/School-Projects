template <class DATATYPE>
class QueueListClass {  
    DATATYPE *dynamicAry = nullptr;        // dynamic array
    int      queueElementCount = 0;            // number of items in the queue

public:
    // default constructor
    QueueListClass() { queueElementCount = 0; }

/*
Name: CopyToQueueFrom
Function Purpose : Copy to a newly formed queue 
Function Design:   allocates new memory for a new array to contain a copy of the queue
Inputs:            DATATYPE* newAry 
                   const QueueListClass sourceQueueObj - source object queue to be copied
Outputs:           QueueListClass& *this the newly formed queue
*/
QueueListClass& CopyToQueueFrom(const QueueListClass &obj) {
    if (queueElementCount != 0) {
        Clear();
    }

    dynamicAry = new DATATYPE[obj.queueElementCount];

    for (int i = 0; i < obj.queueElementCount; i++)
    {
        dynamicAry[i] = obj.dynamicAry[i];
        queueElementCount++;
    }
    
    return *this;
}

// copy constructor
QueueListClass(const QueueListClass& QueueListClassObj) {
    CopyToQueueFrom(QueueListClassObj);
}

/*
Name: Enqueue
Function Purpose : add item to the queue
Function Design:   allocates new memory for in a dynamic  new array to contain a copy of the queue
                   if not sucessful memory allocation entry, states the reason and exits
                   creates a new dynamic array that holds the added to queue
                   deletes the old array
Inputs:            DATATYPE data- the item to add to back of the queue 
Outputs:           void
*/
void Enqueue(DATATYPE data) {
    DATATYPE* oldAry;
    oldAry = dynamicAry;

    try {
        dynamicAry = new DATATYPE[queueElementCount + 1];
    }
    catch (const std::bad_alloc&) {
        cout << "Failed to allocate memory. Exiting...";
        exit(0);
    }

    for (int i = 0; i < queueElementCount; i++)
    {
        dynamicAry[i] = oldAry[i];
    }

    dynamicAry[queueElementCount] = data;

    delete[] oldAry;

    queueElementCount++;
}

/*
Name: Denqueue
Function Purpose : take item out of queue front
Function Design:   allocates new memory for in a dynamic  new array to contain a copy of the queue
                   if not sucessful memory allocation entry, states the reason and exits
                   creates a new dynamic array that holds new queue with front removed
                   deletes the old array
Inputs:            none
Outputs:           DATATYPE - the removed item from the front of the queue
*/
DATATYPE Dequeue() {
    if (queueElementCount == 0) {
        return 0;
    }

    DATATYPE* oldAry;
    oldAry = dynamicAry;

    try {
        dynamicAry = new DATATYPE[queueElementCount - 1];
    }
    catch (const std::bad_alloc&) {
        cout << "Failed to allocate memory. Exiting..." << endl;
        exit(0);
    }

    for (int i = 1; i < queueElementCount; i++)
    {
        dynamicAry[i - 1] = oldAry[i];
    }

    queueElementCount--;

    DATATYPE removedItem = oldAry[0];

    delete[] oldAry;
    return removedItem;
}

// operator function operator=(), implements assignment of objects of type QueueListClass
QueueListClass &operator=(QueueListClass& obj) {
    if (this == &obj) {
        return *this;
    }
      
    Clear();

    CopyToQueueFrom(obj);

    return *this;
    }

    // destructor
    ~QueueListClass() {
        if (queueElementCount > 0)
        delete[] dynamicAry;
    }

    /*
    Name: Peek
    Function Purpose : look at item at queue front
    Function Design:   checks if queue is empty
                       returns0
                       gets the front item in the queue
    Inputs:            none
    Outputs:           DATATYPE - the item at the front of the queue
    */
    DATATYPE Peek() {
        if (queueElementCount == 0) {
            return 0;
        }

        return dynamicAry[0];
    }

    /*
    Name: Clear
    Function Purpose : Clears the queue
    Function Design:   if the queue is not empty, it deallocates the queue
    Inputs:            called by the object that invokes it
    Outputs:           void
                       clears the queue that invokes it
    */
    void Clear() {
    if (queueElementCount != 0) {
        delete[] dynamicAry;
    }

    queueElementCount = 0;
    }

    /*
    Name: IsEmpty()
    Function Purpose : Checks if the queue is empty
    Function Design:   Checks the existence of elements in the QueueListClass
    Inputs:            called by object that invokes it
    Outputs:           bool - true if empty, 0 is not empty
                       clears the queue that invokes it
    */
    bool IsEmpty() {
        return queueElementCount == 0; 
    }

    // number items in the QueueListClass
    int getQueueElementCount() {
        return queueElementCount;
    }

    // method that displays QueueListClass Objects
    void Display(const char* objName) {
        cout << "Object: " << objName << endl;
        for (int i = 0; i < queueElementCount; i++)
            cout << dynamicAry[i] << "\t";
        cout << endl;
        cout << "Element Count: " << getQueueElementCount() << endl;
        cout << "---------------------" << endl  << endl;
    }
};

