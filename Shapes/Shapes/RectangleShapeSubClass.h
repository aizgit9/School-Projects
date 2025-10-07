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
		setArea(calculateArea());
	}

	double calculateArea() {
		return width * length;
	}
	
	void display() {
		cout << "\nShape is a Rectangle:\nWidth: " << width << "\nLength: " << length << "\nArea: " << getArea() << endl;
		return;
	}
};

#endif