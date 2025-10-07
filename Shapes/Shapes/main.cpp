/*
* Program Name: Shapes
* Date:         2025-10-6
* Author:       Asher P. Isgitt
* Module Purpose
* User selects from 3 different shapes and inputs their attributes. 
* Information about each shape and its area is displayed after all 3 shapes have been entered.
*/

#include "BasicShapeClass.h"
#include "CircleShapeSubClass.h"
#include "RectangleShapeSubClass.h"
#include "TriangleShapeSubClass.h"
#include "LineInfo.h"
#include <iostream>

using namespace std;

const int SHAPE_COUNT = 3;
int shapesEntered = 0;

BasicShapeClass** shapeArray = new BasicShapeClass*[SHAPE_COUNT];

void handleCircleInput();
void handleRectangleInput();
void handleTriangleInput();
void deallocateMemory();

int main()
{
	// Display Instructions

	cout << "Choose 3 shapes and enter their dimensions. \nWhen all 3 shapes have been entered, their calculated results will be displayed." << endl;

	// Main loop. Gets user input and repeats until all shapes have been entered and successfully added to the array.

	do
	{
		int choice;

		cout << "\nChoose a shape:\n1. Circle \n2. Rectangle\n3. Triangle\n\nEnter your choice: ";

		// Check if input was valid

		if (cin >> choice) {

			// Check if input was within the correct bounds

			if (choice > SHAPE_COUNT || choice <= 0) {
				cin.clear();
				cin.ignore(1000, '\n');
				cout << "\nWrong input. Please try again." << endl;
				continue;
			}
		}
		else
		{
			//Input was invalid, reset loop and try again
			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}

		// Determine which shape to create based on input.

		switch (choice)
		{
		case 1:
			handleCircleInput();
			++shapesEntered;
			break;
		case 2:
			handleRectangleInput();
			++shapesEntered;
			break;
		case 3:
			handleTriangleInput();
			++shapesEntered;
			break;
		default:
			break;
		}

		// Exit loop once all shapes have been logged.
		if (shapesEntered >= SHAPE_COUNT) {
			break;
		}

	} while (true);

	// Display shape info

	for (int i = 0; i < SHAPE_COUNT; i++)
	{
		shapeArray[i]->display();
	}

	// Deallocate memory

	deallocateMemory();

	// Hold the screen

	cout << "\nPress enter key once or twice to end ... ";
	cin.ignore();
	cin.get();

	exit(EXIT_SUCCESS);

}//main

void handleCircleInput() {
	double radius;
	do
	{
		cout << "\nEnter the circle's radius: ";

		// Check if input was valid

		if (cin >> radius) {

			// Check for domain error

			try
			{
				if (radius < 0) {
					throw domain_error(LineInfo("Radius less than zero", __FILE__, __LINE__));
				}
			}
			catch (exception& e) {
				cout << e.what() << endl;
				cout << endl << "Press the enter key once or twice to leave..." << endl;
				cin.ignore(); cin.get();
				exit(EXIT_FAILURE);
			}

			break; // Input successful
		}
		else {

			// Input was invalid, reset loop and try again

			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}

	} while (true);

	// Create new circle 

	shapeArray[shapesEntered] = new CircleShapeSubClass(radius);

	return;

}// handleCircleInput

void handleRectangleInput() {

	double width;
	double length;

	do
	{
		cout << "\nEnter the rectangle's width, length: ";

		// Check if inputs were valid

		if (cin >> width >> length) {

			// Check for domain error

			try
			{
				if (width < 0 || length < 0) {
					throw domain_error(LineInfo("Width or length less than zero", __FILE__, __LINE__));
				}
			}
			catch (exception& e) {
				cout << e.what() << endl;
				cout << endl << "Press the enter key once or twice to leave..." << endl;
				cin.ignore(); cin.get();
				exit(EXIT_FAILURE);
			}

			break; // Input successful
		}
		else {

			// Input was invalid, reset loop and try again

			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}
	} while (true);

	// Create new rectangle

	shapeArray[shapesEntered] = new RectangleShapeSubClass(width, length);

	return;

}// handleRectangleInput

void handleTriangleInput() {

	double height;
	double base;

	do
	{
		cout << "\nEnter the triangle's height, base: ";

		// Check if inputs were valid

		if (cin >> height >> base) {

			// Check for domain error

			try
			{
				if (height < 0 || base < 0) {
					throw domain_error(LineInfo("Height or base less than zero", __FILE__, __LINE__));
				}
			}
			catch (exception& e) {
				cout << e.what() << endl;
				cout << endl << "Press the enter key once or twice to leave..." << endl;
				cin.ignore(); cin.get();
				exit(EXIT_FAILURE);
			}

			break; // Input successful
		}
		else {

			// Input was invalid, reset loop and try again

			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}
	} while (true);

	// Create new triangle

	shapeArray[shapesEntered] = new TriangleShapeSubClass(height, base);

	return;

}// handleTriangleInput

void deallocateMemory() {
	
	// Delete each array element

	for (int i = 0; i < SHAPE_COUNT; i++)
	{
		delete shapeArray[i];
	}

	// Delete the array

	delete shapeArray;

	return;

}// deallocateMemory