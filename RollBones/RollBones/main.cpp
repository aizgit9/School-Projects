// main.cpp : Defines the entry point for the console application.

#include <iostream>
#include <iomanip>
#include <string>
#include <stdio.h>
#include <random>

using namespace std;

unsigned askForInititalStakeAmountFunc();
unsigned askForBetDonePlayingFunc(unsigned& stakeUns);
unsigned rollDemBonesFunc(unsigned& rollCountUns);
void     evaluateRollFunc(unsigned diceRollResultsUns, unsigned& rollCountUns, unsigned& stakeUns, unsigned betUns);
bool     pointRollDemBonesFunc(unsigned pointUns, unsigned& rollCountUns);

int main() {
    unsigned
        betUns,
        rollCountUns = 0,
        diceRollResultsUns;



    //$ assign stakeUns result from askForInititalStakeAmountFunc();
    unsigned stakeUns = askForInititalStakeAmountFunc();
    do {
        //$ assign betUns result from askForBetDonePlayingFunc(stakeUns);
        //$ based on betUns determine wether or not to call rollDemBonesFunc(rollCountUns)
        //$ and then call evaluateRollFunc(diceRollResultsUns, rollCountUns, stakeUns, betUns);

        betUns = askForBetDonePlayingFunc(stakeUns);

        if (betUns > 0) {
            diceRollResultsUns = rollDemBonesFunc(rollCountUns);
        }
        else
        {
            break;
        }
        evaluateRollFunc(diceRollResultsUns, rollCountUns, stakeUns, betUns);
    } while (betUns != 0 && stakeUns != 0); //$ execute loop as long as betUns != 0 and stakeUns != 0;


    //$ Out of loop
    //$ Check if betUns is 0 
    //$   then display player ends game
    //$   else display player out of money

    //$ display a Roll Count message;
    //$ display a final stake amount messaqge
    if (betUns == 0) {
        cout << "Player ended the game." << endl;
    }
    else
    {
        cout << "Player ran out of money." << endl;
    }

    cout << "Roll Count: " << rollCountUns << endl;
    cout << "Final Stake Amount: " << stakeUns << endl;

    // $ Hold the screen before exiting
    exit(EXIT_SUCCESS);
}

/*
Name:              askForInitialStakeAmountFunc
Function Purpose : Retrieves the initial money from prompting the user
Function Design:   Checks if the input stake amount the player enters a proper amount:
                   stakeStartUns > 0
                   not a negative amount
Inputs:            None
Outputs:           By function name an unsigned integer that's the stake amount
*/

unsigned askForInititalStakeAmountFunc() {
    int inputStakeAmount;
    do {
        //$ ask for stake amount
        //$ if stake amount > 0) leave check loop
        //$  else 
        //$ display message that You have to enter a > 0 or positive amount of money to bet with. Try again!
        //$ continue the loop

        cout << "What is your stake amount? ";
        cin >> inputStakeAmount;

        if (inputStakeAmount > 0) {
            break;
        }
        else {
            cout << "You have to enter a > 0 or a positive amount of money to bet with. Try again!" << endl;
        }

    } while (true);

    // $ return stake start amount
    return inputStakeAmount;
}

/*
Name: askForBetDonePlayingFunc
Function Purpose : Asks for what the player will bet and checks for validity
Function Design:   Checks for valid entry
                   if not valid entry, staes the reason why
                   retry entry if not valid
Inputs:            stakeUns - The total stake amount
Outputs:           By function name an unsigned integer that's the bet amount
*/

unsigned askForBetDonePlayingFunc(unsigned& stakeUns) {

    //$ design necessary code
    int inputBet;
    int stakeInt = stakeUns;
    unsigned validBet;

    //Design a validation loop
    do {
        //$ display current stake amount
        //$ ask for a bet
        cout << "Current stake amount: " << stakeUns << endl;
        cout << "What will you bet? ";
        cin >> inputBet;

        //$ check if input  amount more than stake amount
           //$ display error message
           //$ continue the loop
        if (inputBet > stakeInt) {
            cout << "Your bet cannot be more than your stake amount. Please try again." << endl;
            continue;
        }

        //$ check if input bet amount is less than 0
           //$ display error message
           //$ continue the loop
        if (inputBet < 0) {
            cout << "Your bet cannot be less than 0. Please try again." << endl;
            continue;
        }

        //$ set valid bet amount
           // leave the loop
        validBet = inputBet;
        break;

    } while (true);

    //$ return the valid inputted bet
    return(validBet);
}

/*
Name:             rollDemBonesFunc
Function Purpose: generates an independent random number for each die
                  calculates the roll sum
                  increments rollCountUns
Function Design:  Prompts the user to throw the dice
                  Using rand() generates 2 random variables from 1 to 6 and adds to simulate dice throw
Inputs/Outpuut:   &rollCountUns - Reference of total rolls count in game
Outputs:          By function name an unsigned integer that's the sum of the two rolled dice
*/

unsigned rollDemBonesFunc(unsigned& rollCountUns) {

    //$ display Press enter key once or twice to throw the dice
    //$ see assigment to use ignore() and get() to hold the screen
    cout << "Press the enter key once or twice to throw the dice..."; cin.ignore(); cin.get();

    //$ increment the roll count
    rollCountUns = rollCountUns + 1;

    //$seed the random number generator
    srand(clock());

    //$execute the dice roll as two separet rolls
    int min = 1;
    int max = 6;

    unsigned dieOne = rand() % (max - min + 1) + min;
    unsigned dieTwo = rand() % (max - min + 1) + min;

    unsigned diceSum = dieOne + dieTwo;

    cout << "Die 1 landed on " << dieOne << "." << endl;
    cout << "Die 2 landed on " << dieTwo << "." << endl;
    cout << "The throw result is " << diceSum << "." << endl;

    //$ return the dice sum
    return(diceSum);
}

/*
Name: evaluateRollFunc
Function Purpose: Check for a winning roll, a losing roll, or a point roll result
                  Adjust stakeUns using betUns for win or loss result
Function Design:  2, 3, 12      loses
                  7, 11         winner
                  anything else executes point rolls
Inputs:           diceRollResultsUns - The dice roll sum
                  betUns             - The placed bet
Input/Output:     &rollCountUns      - Reference to tally of total rolls
                  &stakeUns          - Reference to the total at stake
*/

void evaluateRollFunc(unsigned diceRollResultsUns, unsigned& rollCountUns, unsigned& stakeUns, unsigned betUns) {
    //$ Code up this function as per game rules in assignment
    switch (diceRollResultsUns)
    {
    case 2:
        //$ lose
        stakeUns = stakeUns - betUns;
        cout << "You lost." << endl;
        break;
    case 3:
        //$ lose
        stakeUns = stakeUns - betUns;
        cout << "You lost." << endl;
        break;
    case 12:
        //$ lose
        stakeUns = stakeUns - betUns;
        cout << "You lost." << endl;
        break;
    case 7:
        //$ win
        stakeUns = stakeUns + betUns;
        cout << "You won!" << endl;
        break;
    case 11:
        //$ win
        stakeUns = stakeUns + betUns;
        cout << "You won!" << endl;
        break;
    default:
        if (pointRollDemBonesFunc(diceRollResultsUns, rollCountUns)) {
            stakeUns = stakeUns + betUns;
            cout << "You won!" << endl;
        }
        else
        {
            stakeUns = stakeUns - betUns;
            cout << "You lost." << endl;
        }

        break;
    }
}

/*
Name:             pointRollDemBonesFunc
Function Purpose: Executes the point rolls
Function Design:  Displays the point value.
                  Executes repeating rolls using rollDemBonesFunc until the point or 7 is the result
                  Each roll passes to rollDemBonesFunc() the rollCountUns and recives back the rollCountUns
Inputs:           pointUns      - The point set by the first roll
Inputs/Outputs    &rollCountUns - Reference to total roll count
Outputs:          After point rolls produces a return for a win (true) or a loss (false)
*/

bool pointRollDemBonesFunc(unsigned pointUns, unsigned& rollCountUns) {

    //Executes until point  value or 7 is rolled
    do
    {
        cout << "The point is " << pointUns << "." << endl;
        unsigned rollResult = rollDemBonesFunc(rollCountUns);

        if (rollResult == pointUns) {
            return true;
        }
        else if (rollResult == 7) {
            return false;
        }

    } while (true);

    return(false);
}


