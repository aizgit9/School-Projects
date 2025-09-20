/*
* Program Name: MatrixVerticalAdd
* Date:         2025-9-19
* Author:       Asher P. Isgitt
* Module Purpose
* This program processes matrices from an input file to:
* Add up the sums of each column
* Determine if they have vertical additive symmetry
* Sort their rows in ascending order
*/

#include <string>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <algorithm>

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

    // Display file reading error message
    if (inputFileStreamObj.fail()) {
        cout << "File " << INPUT_FILE_NAME << "could not be opened !" << endl; 
        cout << endl << "Press the enter key once or twice to leave..." << endl; cin.ignore(); cin.get();
        exit(EXIT_FAILURE); 
    }

    do {
        //Ends program when the reader reaches the end of the file
        if (readMatrixFromFile(matrix, height, width, inputFileStreamObj) )
        break;

        //Displays the input matrix
        cout << "Input:" << endl;
        displayMatrix        (matrix, height, width);

        //Displays the column sums and symmetry check result
        displayCalcMatrixSums(matrix, height, width, colSums);
        symmetryCheckMatrix  (colSums, width, height);

        //Displays the sorted matrix
        sortMatrixRows(matrix, width, height);
        cout << "Sorted:" << endl;
        displayMatrix        (matrix, height, width);

        cout << endl << "Press the enter key once or twice to continue..." << endl; cin.ignore(); cin.get(); 
     
    } while (true);

    cout << "Program Done" << endl;

    exit(EXIT_SUCCESS);
}

// Read the height and width of the matrix from the input file
// Loop through the input file numbers and add them to the matrix array
bool readMatrixFromFile(int matrix[][MAX_MATRIX_SIZE], unsigned& height, unsigned& width, ifstream& inputFileStreamObj) {
    inputFileStreamObj >> height;
    inputFileStreamObj >> width;

    for (int row = 0; row < height; row++) {
        for (int col = 0; col < width; col++) {

            // Returns true when the end of the file is reached
            if (!(inputFileStreamObj >> matrix[row][col])) {
                return true;
            }
        }
    }

    return(false);
}

// Display the values of the matrix in a rectangular tabular format
void displayMatrix(int matrix[][MAX_MATRIX_SIZE], unsigned height, unsigned width) {
    for (int row = 0; row < height; row++) {
        cout << "\t";

        for (int col = 0; col < width; col++) {
            cout << std::right << std::setw(5) << matrix[row][col] << "\t";
        }

        cout << endl;
    }

    cout << endl;
}

// Add up the sums of each column in the matrix
// Display the sums in a rectangular tabular format
void displayCalcMatrixSums(int matrix[][MAX_MATRIX_SIZE], unsigned height, unsigned width, int colSums[MAX_MATRIX_SIZE]) {
    cout << "Sums:" << endl;
    cout << "\t";

    for (int col = 0; col < width; col++) {
        int colSum = 0;

        for (int row = 0; row < height; row++) {
            colSum += matrix[row][col];
        }
        
        colSums[col] = colSum;

        cout << std::right << std::setw(5) << colSum << "\t";
    }

    cout << endl << endl;
 }
 

// Check colSums to see if the array has vertical additive symmetry
void symmetryCheckMatrix(int colSums[], unsigned width, unsigned height) {
    cout << "Vertical additive symmetry: ";

    int reversedColSums[MAX_MATRIX_SIZE] = { 0 };
    int j = 0;

    // Reverse colSums
    for (int i = width - 1; i >= 0; i--) {
        reversedColSums[j] = colSums[i];
        j++;
    }

    // Compare reversedColSums with colSums
    for (int i = 0; i < width; i++) {
        if ((reversedColSums[i] != colSums[i])) {
            cout << "No" << endl << endl;

            return;
        }
    }

    cout << "Yes" << endl << endl;
}

// Sort each row in the array in ascending order
void sortMatrixRows(int matrix[][MAX_MATRIX_SIZE], unsigned width, unsigned height) {
    for (int row = 0; row < height; row++) {
        std::sort(matrix[row], matrix[row] + width);
    }
 }
