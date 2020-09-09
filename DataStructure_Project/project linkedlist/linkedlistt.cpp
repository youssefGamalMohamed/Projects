#include "linkedlistt.h"

linkedlistt::linkedlistt()
{
	head = tail = NULL;
	size = 0;
}
void   linkedlistt::append(int number)
{

	nodee*temp = new nodee(number);
	if (tail == NULL&&head == NULL) //for the first node
	{
		head = tail = temp;
	}
	else               //for other nodes
	{
		tail->next = temp;
		tail = temp;
	}
	size++;   //while we add every node the size is addded by 1 , to determine the size of linkedlist
}
void linkedlistt::insertAt(int val, int pos) //add between any two numbers in linkedlist
{
	assert(pos >= 0 && pos<size);
	nodee * temp2 = head;
	nodee * newnodee = new nodee(val);
	if (pos == 0) { newnodee->next = head; head = newnodee; }
	else
	{
		for (int i = 0; i<pos - 1; i++)
		{
			temp2 = temp2->next;
		}
		newnodee->next = temp2->next;
		temp2->next = newnodee;
	}
	size++;

}
void linkedlistt::search(int num) //search for any number in linkedlist
{
	nodee*temp3 = head;
	bool flag = false;
	for (int i = 0; i < size; i++)
	{
		if (num == temp3->data)
		{
			flag = true;
			break;
		}
		temp3 = temp3->next;
	}
	if (flag)
		cout << "number is found" << endl;
	else
		cout << "number is not found" << endl;
}
void linkedlistt::Delete() //delete from the end of the linked list 
{
	nodee *temp4 = head;
	for (int i = 0; i < size - 2; i++)
	{
		temp4 = temp4->next;
	}
	delete temp4->next;
	tail = temp4;
	size--;

}
void linkedlistt::DeleteAt(int position) //delete number between any two numbers
{
	assert(position >= 0 && position < size);
	nodee  *temp5 = head;

	if (position == 0)
	{
		head = head->next;
		delete temp5;
	}
	else
	{
		for (int i = 0; i<position - 1; i++)
		{
			temp5 = temp5->next;
		}
		nodee*del = temp5->next;
		temp5->next = del->next;
		delete del;
		if (position == size - 1)
		{
			tail = temp5;
		}
		size--;
	}
}

void  linkedlistt::sort() //sort numbers in linkedlist
{

	int cntr = 0;
	do
	{
		nodee*temp6 = head;
		cntr = 0;
		for (int i = 0; i<size - 1; i++)
		{
			if (temp6->data>temp6->next->data)
			{
				swap(temp6->data, temp6->next->data);
				cntr++;
			}
			temp6 = temp6->next;
		}
	} while (cntr != 0);
}
void linkedlistt::display() //display numbers of linkedlist

{
	nodee*temp7 = head;

	for (int i = 0; i < size; i++)
	{
		cout << temp7->data << " ";
		temp7 = temp7->next;
	}
	



}

void linkedlistt::displaay() //display numbers of linkedlist

{
	nodee*temp8 = head;

	for (int i = 0; i < size; i++)
	{
		cout << temp8->data << endl;
		temp8 = temp8->next;
	}
	



}

