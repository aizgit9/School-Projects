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

    
    /*$$
    calculate the multResult from mult01 and mult02
    check if mult01 is equal to the multResult divided by mult02
    if it is equal then leave with a true
    if not then leave with a false (overflow)
    */

}
template <class TypeMultiply>
void calculateTimeFactorialLoopFunc(void) {

    //$$ set  start time  

    TypeMultiply multiplier = 1,
        factorialResult = 1;

    while (/*$$ invoke isSafeMultiply with multiplier and factorialResult*/ 0) {
        //$$ display the multiplier and the factorial result using field widths of 3 and 27 respectively
        // increment the multiplier
    }

    // calculate timeElapsed as described in the assignment

    //$$ display Unsigned overflow at : multiplier
    //$$ display Time Elapsed (nano)  : timeElapsed.count()

}//calculateTimeFactorialLoopFunc

 //------------------------------------------
template <class TypeMultiply>
void factorialRecursiveFunc(TypeMultiply& multiplier, TypeMultiply factorialResult) {

    if (/*$$ invoke isSafeMultiply <TypeMultiply> with multiplier and factorial result)*/ 0) {
        //$$ display the multiplier and the factorial result using field widths of 3 and 27 respectively
        //$$ invoke factorialRecursiveFunc with ++multiplier and factorialResult
    }
    return;

}//factorialRecursive

 //------------------------------------------  
template <class TypeMultiply>
void calculateTimeFactorialRecursiveFunc() {

    //$$ set start time

    TypeMultiply mult01 = 1;
    factorialRecursiveFunc <TypeMultiply>(mult01, 1);

    //$$ set time elapsed 

    //$$ display Unsigned overflow at : mult01
    //$$ display Time Elapsed (nano)  : timeElapsed.count()

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
