#ifndef RECTANGLESHAPESUBCLASS_H
#define RECTANGLESHAPESUBCLASS_H

#include "BasicShapeClass.h"
#include <iostream>

using namespace std;

class RectangleShapeSubClass : public BasicShapeClass {

private:

	double width;
	double length;

public:

	RectangleShapeSubClass(double width, double length) {
		this->width = width;
		this->length = length;
	}

	double calculateArea() {
		return width * length;
	}
	
	void display() {
		return;
	}
};

#endif