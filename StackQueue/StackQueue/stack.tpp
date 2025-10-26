// Template class Stack based on a singly linked list
template <class Type>
class StackListClass {
    private:

    // The structure describing the node
    template <class Type>
    struct NodeStackStruct {
        Type data;
        NodeStackStruct<Type>* nextNodePtr;
    };

    NodeStackStruct<Type>* stackTopNodePtr = nullptr;         // stack top pointer
    unsigned               stackNodeCount = 0;               // stack node count

    /*
    Name: AllocateNodeSafeMemory(void)
    Function Purpose : add item to the queue
    Function Design:   allocates new memory for in a dynamic memory
    if not sucessful memory allocation, states the reason and exits
    Inputs:            void
    Outputs:           NodeStackStruct<Type>*
    */
    NodeStackStruct<Type>* allocateNodeSafeMemory(void) {
        NodeStackStruct<Type>* newMemoryPtr;

        try {
            newMemoryPtr = new NodeStackStruct<Type>;
        }
        catch(const std::bad_alloc&) {
            cout << "Failed to allocate memory. Exiting..." << endl;
            exit(0);
        }

        return newMemoryPtr;
    }

    /*
    Name: CopyToStackFrom
    Function Purpose : Copy to a newly formed queue
    Function Design:   allocates new memory for a new array to contain a copy of the queue
    Inputs:            const StackListClass& srcStackListRef  -source stack
    Outputs:           void
    const StackListClass& targetStackListRef  - target stack
    */
    void copyToStackFrom(const StackListClass& srcStackListRef) {
        if (srcStackListRef.stackTopNodePtr != nullptr) {

            NodeStackStruct<Type>* traverseStackPtr;
            traverseStackPtr = srcStackListRef.stackTopNodePtr;
            NodeStackStruct<Type>* currentNodePtr = allocateNodeSafeMemory();
            stackTopNodePtr = currentNodePtr;
            stackNodeCount = srcStackListRef.stackNodeCount;

            do {

                currentNodePtr->data = traverseStackPtr->data;

                if (traverseStackPtr->nextNodePtr == nullptr) {
                    currentNodePtr->nextNodePtr = nullptr;
                    break;
                }

                currentNodePtr->nextNodePtr = allocateNodeSafeMemory();
                currentNodePtr = currentNodePtr->nextNodePtr;

                traverseStackPtr = traverseStackPtr->nextNodePtr;

            } while (true);
        }
    }

    public:
    // default constructor
    StackListClass() {
        stackTopNodePtr = nullptr; 
    }

    // copy constructor
    StackListClass(const StackListClass& stackListRef) {
        copyToStackFrom(stackListRef);
    }

    /*
    Name: Push
    Function Purpose : add passed item to the stack top
    Function Design:   allocates new memory for new stack top
    use AllocateNodeSafeMemory()
    adjust stack node count
    Inputs:            Type data- the item to put on the stack top
    Outputs:           void
    */
    void Push(Type data) {
        NodeStackStruct<Type>* newNodePtr = allocateNodeSafeMemory();
        newNodePtr->data = data;
        newNodePtr->nextNodePtr = stackTopNodePtr;
        stackTopNodePtr = newNodePtr;
        stackNodeCount++;
    }

    /*
    Name: Pop()
    Function Purpose : take item out of stack top
    Function Design:   deallocates old stack top
    Inputs:            none
    Outputs:           TYPE - the removed item from the top of the stack
    */
    Type Pop() {

        NodeStackStruct<Type>* newTopNodePtr = stackTopNodePtr->nextNodePtr;
        Type removedItem = stackTopNodePtr->data;
        delete stackTopNodePtr;
        stackTopNodePtr = newTopNodePtr;

        stackNodeCount--;
        return removedItem;

    }

    // Get number nodes in the stack
    unsigned getstackNodeCount() {
        return stackNodeCount;
    }

    /*
    Name: Clear
    Function Purpose : Clears the stack  - removes all elements from the stack
    Function Design:   if the stack is not empty, it deallocates the stack
    Inputs:            called by the object that invokes it
    Outputs:           void
    clears the stack that invokes it
    */
    void Clear() {
        if (stackNodeCount != 0) {
            NodeStackStruct<Type>* traverseStackPtr;
            traverseStackPtr = stackTopNodePtr;

            NodeStackStruct<Type>* tempNodePtr;

            do
            {
                tempNodePtr = traverseStackPtr->nextNodePtr;

                delete traverseStackPtr;

                traverseStackPtr = tempNodePtr;

            } while (traverseStackPtr != nullptr);

            stackTopNodePtr = nullptr;
            stackNodeCount = 0;
        }
    }

    // = operator
    StackListClass<Type>& operator=(const StackListClass<Type>& stackListRef) {
        // is target stack not empty, then clear it
        
        if (this == &stackListRef) {
            return *this;
        }

        Clear();
        copyToStackFrom(stackListRef);
        return *this;
    }

    // Display the stack
    void Display(const char* objName) {
        cout << "Object: " << objName << endl;

        if (stackTopNodePtr != nullptr) {
            NodeStackStruct<Type>* transverseStackPtr;
            cout << "top:" << endl;
            transverseStackPtr = stackTopNodePtr;

            while (transverseStackPtr != nullptr) {
            cout << transverseStackPtr->data << endl;
            transverseStackPtr = transverseStackPtr->nextNodePtr;
            }
        }//if
        else {
            cout << "stack is empty." << endl;
        }

        cout << "stack node count : " << getstackNodeCount() << endl;
        cout << endl << endl;
    }

    // destructor
    ~StackListClass() { Clear(); }

};
