#ifndef BASICSHAPECLASS_H
#define BASICSHAPECLASS_H

#include <iostream>

using namespace std;

class BasicShapeClass {

private:

	double area;

public:
	double getArea() {
		return area;
	}

	void setArea(double area) {
		this->area = area;
		return;
	}

	virtual double calculateArea() = 0;

	virtual void display() = 0;
};

#endif