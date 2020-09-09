#include "nodee.h"
#include <iostream>
#include<assert.h>
#include<string>
using namespace std;
nodee::nodee()
{

	data = 0;
	next = NULL;
}
nodee::nodee(int value)  //if we pass value to node 
{
	data = value;
	next = NULL;
}


