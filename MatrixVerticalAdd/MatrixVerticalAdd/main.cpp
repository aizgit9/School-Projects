// Put in a prologue

/*
Program Name: MatrixVerticalAdd
Date:         2025-9-19
Author:       Asher P. Isgitt
Module Purpose
This program processes matrices to determine if they have vertical additive symmetry, and then sorts their rows in ascending order.
*/

#include <string>
#include <iostream>
#include <fstream>
#include <iomanip>

using namespace std;

const unsigned MAX_MATRIX_SIZE   = 20;
const unsigned WIDTH_DISPLAY     = 12;

bool    readMatrixFromFile (int [][MAX_MATRIX_SIZE], unsigned&, unsigned&, ifstream&);
void         displayMatrix (int [][MAX_MATRIX_SIZE], unsigned,  unsigned);
void displayCalcMatrixSums (int [][MAX_MATRIX_SIZE], unsigned,  unsigned,  int[MAX_MATRIX_SIZE]);
void   symmetryCheckMatrix (int [], unsigned,  unsigned);
void        sortMatrixRows (int [][MAX_MATRIX_SIZE], unsigned,  unsigned);


int main() {
  unsigned height,
           width;
  int      matrix[MAX_MATRIX_SIZE][MAX_MATRIX_SIZE],
           colSums[MAX_MATRIX_SIZE];
  string   INPUT_FILE_NAME = "matrixes.txt";
  ifstream inputFileStreamObj(INPUT_FILE_NAME);

  if (inputFileStreamObj.fail()) {
     cout << "File " << INPUT_FILE_NAME << "could not be opened !" << endl; 
     cout << endl << "Press the enter key once or twice to leave..." << endl; cin.ignore(); cin.get();
     exit(EXIT_FAILURE); 
   }

   do {  

     if (readMatrixFromFile(matrix, height, width, inputFileStreamObj) )
       break;

     cout << "Input:" << endl;
     displayMatrix        (matrix, height, width);
     displayCalcMatrixSums(matrix, height, width, colSums);
     symmetryCheckMatrix  (colSums, width, height);
     sortMatrixRows       (matrix,  width, height);
     cout << "Sorted:" << endl;
     displayMatrix        (matrix, height, width);

     cout << endl << "Press the enter key once or twice to continue..." << endl; cin.ignore(); cin.get(); 
     
   } while (true);

   cout << "Program Done" << endl;

   exit(EXIT_SUCCESS);
}

/*
* Reads the height and width of the matrix from the input file.
* Loops through the input file numbers based on the given height and width.
* Adds them to the matrix array.
*/
bool readMatrixFromFile(int matrix[][MAX_MATRIX_SIZE], unsigned& height, unsigned& width, ifstream& inputFileStreamObj) {
    inputFileStreamObj >> height;
    inputFileStreamObj >> width;
    
    for (int row = 0; row < height; row++)
    {
        for (int col = 0; col < width; col++)
        {
             inputFileStreamObj >> matrix[row][col];
        }
    }

    return(false);
}

/*
* Loops through the matrix and prints out the values in a square height by width format.
*/
void displayMatrix(int matrix[][MAX_MATRIX_SIZE], unsigned height, unsigned width) {
    for (int row = 0; row < height; row++)
    {
        for (int col = 0; col < width; col++)
        {
            cout << matrix[row][col] << "   ";
        }
        cout << endl;
    }
}

/*
* Adds up the sums of each column in the matrix and then display them.
*/
void displayCalcMatrixSums(int matrix[][MAX_MATRIX_SIZE], unsigned height, unsigned width, int colSums[MAX_MATRIX_SIZE]) {
    cout << "Sums:" << endl;
    for (int col = 0; col < width; col++)
    {
        int colSum = 0;

        for (int row = 0; row < height; row++)
        {
            colSum += matrix[row][col];
        }
        
        colSums[col] = colSum;
        cout << colSum << "   ";
    }
    cout << endl;
 }
 

void symmetryCheckMatrix(int colSums[], unsigned width, unsigned height) {
    int reversedColSums[MAX_MATRIX_SIZE] = { 0 };
    cout << "Vertical additive symmetry: ";

    int j = 0;
    for (int i = width - 1; i >= 0; i--)
    {
        reversedColSums[j] = colSums[i];
        j++;
    }

    for (int i = 0; i < width; i++)
    {
        if (!(reversedColSums[i] == colSums[i]))
        {
            cout << "No" << endl;
            return;
        }
    }
    cout << "Yes" << endl;
}

void sortMatrixRows(int matrix[][MAX_MATRIX_SIZE], unsigned width, unsigned height) {
    
 }
