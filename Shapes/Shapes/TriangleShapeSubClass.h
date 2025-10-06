#ifndef TRIANGLESHAPESUBCLASS_H
#define TRIANGLESHAPESUBCLASS_H

#include "BasicShapeClass.h"
#include <iostream>

class TriangleShapeSubClass : public BasicShapeClass {
private:
	
	double height;
	double base;

public:

	TriangleShapeSubClass(double height, double base) {
		this->height = height;
		this->base = base;
	}

	double calculateArea() {
		return 0.5 * base * height;
	}

	void display() {
		return;
	}
};
#endif