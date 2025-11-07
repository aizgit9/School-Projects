/*
Program Name: Graph Connected
Date:
2025-11-6
Author:
Asher Isgitt
Module Purpose:
Contains a simple graph class using an adjancency list.
Creates graphs from graphs.txt file.
Determines if different graphs are connected.
*/

#include <iostream>
#include <vector>
#include <list>
#include <fstream>
#include <string>
#include <sstream>


using namespace std;

class Graph {
private:

    int maxSize; //Max number of vertices
    int numVertices; // Current number of vertices

    vector<list<int>> adjList; // The adjacency list

public:

    //Default Constructor

    Graph() {
        numVertices = 0;
        maxSize = 10;
        adjList.resize(maxSize);
    }
    // Initializes the graph max size V

    Graph(int V) {
        numVertices = 0;
        maxSize = V;
        adjList.resize(maxSize);
    }

    // Prints the graph's representation.

    void displayGraph() {

        for (int i = 1; i <= numVertices; i++)
        {
            cout << "Vertex " << i << ": ";
            
            for (int vert : adjList[i]) {
                cout << vert << " ";
            }

            cout << endl;
        }

        cout << endl;
    }

    bool isEmpty() {
        return numVertices == 0;
    }

    //Creates a graph from input file

    void createGraph(ifstream& file) {
        file >> numVertices;
        string line;

        // Clear the first line

        getline(file, line);
        
        int i = 0;

        while (i < numVertices && getline(file, line)) {

            istringstream iss(line);
            int vertex;

            iss >> vertex;

            int num;

            while (iss >> num) {
                adjList[vertex].push_back(num);
            }

            i++;
        }
    }

    // Returns true if graph is connected, returns false otherwise

    bool isConnected() {

        // Conduct depth first search starting from each vertex in adjList

        for (int vertex = 1; vertex <= numVertices; vertex++)
        {
            vector<bool> visitedVertices(numVertices + 1);

            depthFirstSearch(vertex, visitedVertices);

            for (int v = 1; v <= numVertices; v++)
            {
                if (!visitedVertices[v]) {
                    return false;
                }
            }
        }

        return true;
    }

    void depthFirstSearch(int vertex, vector<bool>& visited) {

        // Mark current vertex as visited

        visited[vertex] = true;

        // Loop through adjancent vertices and recurse on each

        for (int v : adjList[vertex])
        {
            if (!visited[v]) {
                depthFirstSearch(v, visited);
            }
        }
    }
};

// Driver program to test Graph class

int main()
{
    ifstream file("graphs.txt");


    if (!file) { // Check if the file opened successfully
        cout << "File not opened successfully!" << endl;
    }

    for (int i = 0; i < 3; i++)
    {
        Graph* newGraph = new Graph();

        newGraph->createGraph(file);

        cout << "Graph " << i + 1 << ":" << endl;
        newGraph->displayGraph();

        if (newGraph->isEmpty()) {
            cout << "Graph is empty!" << endl << endl;
        }

        if (newGraph->isConnected()) {
            cout << "Graph is connected." << endl << endl;
        }
        else {
            cout << "Graph is not connected." << endl << endl;
        }

        delete newGraph;
    }

    return 0;
};

