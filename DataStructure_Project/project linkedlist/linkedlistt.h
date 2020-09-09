
#include "nodee.h"
class linkedlistt
{
public:
	nodee*head;
	nodee*tail;
	int size;
public:
	linkedlistt();
	void append(int number);
	void insertAt(int val, int pos);
	void search(int num); //search for any number in linkedlist
	void Delete();
	void DeleteAt(int position);
	void sort();
	void display();
	void displaay();
	

};

