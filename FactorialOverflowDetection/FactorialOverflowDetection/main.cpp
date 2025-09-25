/*
* Program Name: FactorialOverflowDetection
* Date:         2025-9-25
* Author:       Asher P. Isgitt
* Module Purpose
* Uses a loop technique and a recursive method to calculate factorials until an overflow is encountered. 
*/

#include <chrono>
#include <limits>
#include <locale>

#include <iostream>
#include <iomanip>
#include <string>

using namespace std;
using namespace chrono;

template <class TypeMultiply>
bool isSafeMultiply(TypeMultiply mult01, TypeMultiply mult02, TypeMultiply& multResult) {

    /*$$
    add code to check if mult01 or mult02 = 0
    if so, set multResult to 0 and leave with a true
    */

    if (mult01 == 0 || mult02 == 0) {
        multResult = 0;
        return true;
    }
    
    /*$$
    calculate the multResult from mult01 and mult02
    check if mult01 is equal to the multResult divided by mult02
    if it is equal then leave with a true
    if not then leave with a false (overflow)
    */

    multResult = mult01 * mult02;

    if (mult01 == multResult / mult02) {
        return true;
    }
    
    
    return false;
}
template <class TypeMultiply>
void calculateTimeFactorialLoopFunc(void) {

    //$$ set  start time  
    auto timeStart = steady_clock::now();

    TypeMultiply multiplier = 1,
        factorialResult = 1;

    /*$$ invoke isSafeMultiply with multiplier and factorialResult*/
    while (isSafeMultiply(multiplier, factorialResult, factorialResult)) {
        //$$ display the multiplier and the factorial result using field widths of 3 and 27 respectively
        // increment the multiplier
        cout << std::setw(3) << multiplier << std::setw(27) << factorialResult << endl;
        ++multiplier;
    }

    // calculate timeElapsed as described in the assignment
    auto timeElapsed = duration_cast<nanoseconds> (steady_clock::now() - timeStart);

    //$$ display Unsigned overflow at : multiplier
    cout << endl << "Unsigned overflow at : " << multiplier << endl;

    //$$ display Time Elapsed (nano)  : timeElapsed.count()
    cout << "Time Elapsed(nano) : " << timeElapsed.count();
    
}//calculateTimeFactorialLoopFunc

 //------------------------------------------
template <class TypeMultiply>
void factorialRecursiveFunc(TypeMultiply& multiplier, TypeMultiply factorialResult) {

    if (isSafeMultiply(multiplier, factorialResult, factorialResult)) {
        //$$ display the multiplier and the factorial result using field widths of 3 and 27 respectively
        cout << std::setw(3) << multiplier << std::setw(27) << factorialResult << endl;

        //$$ invoke factorialRecursiveFunc with ++multiplier and factorialResult
        factorialRecursiveFunc(++multiplier, factorialResult);
    }
    return;

}//factorialRecursive

 //------------------------------------------  
template <class TypeMultiply>
void calculateTimeFactorialRecursiveFunc() {

    //$$ set start time
    auto timeStart = steady_clock::now();

    TypeMultiply mult01 = 1;
    factorialRecursiveFunc <TypeMultiply>(mult01, 1);

    //$$ set time elapsed 
    auto timeElapsed = duration_cast<nanoseconds> (steady_clock::now() - timeStart);

    //$$ display Unsigned overflow at : mult01
    cout << endl << "Unsigned overflow at : " << mult01 << endl;

    //$$ display Time Elapsed (nano)  : timeElapsed.count()
    cout << "Time Elapsed(nano) : " << timeElapsed.count();

}//calculateTimeFactorialRecursiveFunc()

template <typename TYPESIZE>
class FactorialCalculationClass {

private:
    unsigned typeSizeBits;

public:
    // Constructor
    FactorialCalculationClass(unsigned typeSize) {
        typeSizeBits = typeSize;
     }

    void executeFactorialForType() {

        cout <<
            typeSizeBits <<
            " bit unsigned Factorial Loop" << endl <<
            "------------------------------" << endl;
        calculateTimeFactorialLoopFunc <TYPESIZE>();
        cout << endl << endl;

        cout <<
            typeSizeBits <<
            " bit unsigned Factorial Recursion" << endl <<
            "-----------------------------------" << endl;
        calculateTimeFactorialRecursiveFunc <TYPESIZE>();
        cout << endl << endl;

    }

};// template <class TYPESIZE> class factorialCalculationClass

int main() {
    // condition cout set to local digit separation comas (USA)
    cout.imbue(locale(""));

    /*$$
    create an object of FactorialCalculationClass <uintnn_t> called factorialCalculateUintnnObj(nn)
    where nn is the size in bits for the template type uintnn_t, the object name factorialCalculateUintnnObj
    and the nn for the argument (nn) to the constructor
    nn must equal nn = 16, 32 and 64 to make the 3 objects
    */

    FactorialCalculationClass<uint16_t> factorialCalculateUint16Obj(16);
    FactorialCalculationClass<uint32_t> factorialCalculateUint32Obj(32);
    FactorialCalculationClass<uint64_t> factorialCalculateUint64Obj(64);

    /*$$
    for each of the 3 nn objects factorialCalculateUintnnObj
    invoke the executeFactorialForType()
    */

    factorialCalculateUint16Obj.executeFactorialForType();
    factorialCalculateUint32Obj.executeFactorialForType();
    factorialCalculateUint64Obj.executeFactorialForType();

    // Hold the screen
    cout << "Press enter key once or twice to end ... ";
    cin.ignore(); 
    cin.get();

    exit(EXIT_SUCCESS);
}
