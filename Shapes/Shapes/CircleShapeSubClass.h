#ifndef CIRCLESHAPESUBCLASS_H
#define CIRCLESHAPESUBCLASS_H

#include "BasicShapeClass.h"
#include <iostream>

using namespace std;

class CircleShapeSubClass : public BasicShapeClass {

private:

	const double PI = 3.14159;
	double radius;

public: 

	CircleShapeSubClass(double radius) {
		this->radius = radius;
	}

	double calculateArea() {
		return PI * radius * radius;
	}

	void display() {
		return;
	}
};

#endif