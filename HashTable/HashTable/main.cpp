// main.cpp : Defines the entry point for the console application.

#include <iostream>
#include <iomanip>
#include <sstream>
#include <fstream>
#include <unordered_map>
#include <string>

using namespace std;

// Defaults in solution folder
string inputFileNameStr = "namesids.txt";

//define namePair using C++  pair template class (2 strings - first & last name)
typedef pair<string, string> namePair;

//define stl::hash function for namePair keys
namespace std {

    template <> class hash <namePair> {
    public:
        size_t operator() (const namePair& namePair) const {
            return hash<string>() (namePair.first) ^ hash<string>() (namePair.second);
        }//size_t operator()
    };//class hash

}//namespace std


void displayHashTableLookupResult(pair<string, string> namePair, unordered_map<pair<string, string>, unsigned int>& hashTable) {

    //$$ use stringstream object to display lookup result
    //$$ display the result id or
    //$$ a message that indicates if there is not a entry in the hash table 

    if (hashTable[namePair]) {
        cout << left << setw(15) << namePair.first << setw(15) << namePair.second << setw(15) << hashTable[namePair] << endl;
    }
    else {
        cout << left << setw(15) << namePair.first << setw(15) << namePair.second << setw(15) << "There is no hash table entry." << endl;
    }
};


int main(int argc, char* argv[]) {

    //define hashTable as namepair keys and integer value identifications (open address linear probe)
    unordered_map<namePair, unsigned int> hashTable;

    //Put in the hash table the namePair keys and associated number ids from text file
    ifstream inputFileStreamObj("namesids.txt");

    // $$ Check if file can be opened

    if (inputFileStreamObj) {
        cout << "File opened successfully!" << endl;
    }
    else {
        cout << "Error opening file." << endl;
    }

    string   firstName, lastName;
    unsigned id;

    // $$ read in to hash table namePair(firstName, lastname)] and set to id from file
    while(inputFileStreamObj >> firstName >> lastName >> id)
    {
        hashTable[namePair(firstName, lastName)] = id;
    }

    // $$ range based for loop to display elements in the hash table map, namePair keys along with ids
    for (auto& entry : hashTable) {
        cout << left << setw(15) << entry.first.first << setw(15) << entry.first.second << setw(15) << entry.second << endl;
    }

    cout << endl << endl;

    //$$ look up 6 ids in hash table, 2 of each are not in the table

    displayHashTableLookupResult(namePair("Robyn", "Fenty"), hashTable);
    displayHashTableLookupResult(namePair("Aubrey", "Graham"), hashTable);
    displayHashTableLookupResult(namePair("Monica", "Lewinsky"), hashTable);
    displayHashTableLookupResult(namePair("Jerry", "Mathers"), hashTable);
    displayHashTableLookupResult(namePair("Betty", "Boop"), hashTable);
    displayHashTableLookupResult(namePair("Natasha", "Romanoff"), hashTable);

    //$$ freeze screen with Press enter key once or twice to end code
    cout << endl << "Press the enter key once or twice to continue..." << endl; cin.ignore(); cin.get();

    return 0;
}

