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


bool parseMenuChoice(int shapeChoice);
void handleCircleInput();
void handleRectangleInput();
void handleTriangleInput();
void freeMemory();

int main()
{
	cout << "Choose 3 shapes and enter their dimensions. \nWhen all 3 shapes have been entered, their calculated results will be displayed." << endl;
	do
	{
		int choice;

		cout << "\nChoose a shape:\n1. Circle \n2. Rectangle\n3. Triangle\n\nEnter your choice: ";

		//Check if input was valid
		if (cin >> choice) {
			//Check if input was within the correct bounds
			if (choice > SHAPE_COUNT || choice <= 0) {
				cin.clear();
				cin.ignore(1000, '\n');
				cout << "\nWrong input. Please try again." << endl;
				continue;
			}
		}
		else
		{
			//Input was invalid -> reset
			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}

		if (parseMenuChoice(choice)) {
			++shapesEntered;
		}

		if (shapesEntered >= SHAPE_COUNT) {
			break;
		}

	} while (true);

	for (int i = 0; i < SHAPE_COUNT; i++)
	{
		shapeArray[i]->display();
	}

	freeMemory();
	return 0;
}

bool parseMenuChoice(int shapeChoice) {
	switch (shapeChoice)
	{
	case 1:
		handleCircleInput();
		break;
	case 2:
		handleRectangleInput();
		break;
	case 3:
		handleTriangleInput();
		break;
	default:
		return false;
	}
	return true;
}

void handleCircleInput() {
	double radius;
	do
	{
		cout << "\nEnter the circle's radius: ";

		//Check if input was valid
		if (cin >> radius) {
			//Check for domain error
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

			//Input was good
			break; //Input successfully retrieved
		}
		else {
			//Invalid input -> reset
			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}

	} while (true);

	shapeArray[shapesEntered] = new CircleShapeSubClass(radius);
	return;
}

void handleRectangleInput() {
	double width;
	double length;

	do
	{
		cout << "\nEnter the rectangle's width, length: ";
		//Check if inputs were valid
		if (cin >> width >> length) {
			//Check for domain error
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

			//Input was good
			break; //Input successfully retrieved
		}
		else {
			//Invalid input -> reset
			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}
	} while (true);

	shapeArray[shapesEntered] = new RectangleShapeSubClass(width, length);
	return;
}

void handleTriangleInput() {

	double height;
	double base;

	do
	{
		cout << "\nEnter the triangle's height, base: ";
		//Check if inputs were valid
		if (cin >> height >> base) {
			//Check for domain error
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

			//Input was good
			break; //Input successfully retrieved
		}
		else {
			//Invalid input -> reset
			cin.clear();
			cin.ignore(1000, '\n');
			cout << "\nWrong input. Please try again." << endl;
			continue;
		}
	} while (true);

	shapeArray[shapesEntered] = new TriangleShapeSubClass(height, base);
	return;

}

void freeMemory() {
	for (int i = 0; i < SHAPE_COUNT; i++)
	{
		delete shapeArray[i];
	}
	delete shapeArray;
	return;
}