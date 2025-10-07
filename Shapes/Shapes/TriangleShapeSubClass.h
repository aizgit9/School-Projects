#ifndef TRIANGLESHAPESUBCLASS_H
#define TRIANGLESHAPESUBCLASS_H

#include "BasicShapeClass.h"
#include <iostream>

using namespace std;

class TriangleShapeSubClass : public BasicShapeClass {

private:
	
	double height;
	double base;

public:

	TriangleShapeSubClass(double height, double base) {
		this->height = height;
		this->base = base;
		setArea(calculateArea());
	}

	double calculateArea() {
		return 0.5 * base * height;
	}

	void display() {
		cout << "\nShape is a Triangle:\nHeight: " << height << "\nBase: " << base << "\nArea: " << getArea() << endl;
		return;
	}
};
#endif