#include <iostream>
#include "linkedlistt.h"
#include <stdlib.h>

using namespace std;

int main()
{
	linkedlistt list;
	cout << "                        welcome to our programe              " << endl;
	while (true) {
		cout << "1-add node from end (append)   " << endl;
		cout << "2-add node at any position (insert at)  " << endl;
		cout << "3-search about any value   " << endl;
		cout << "4-delet Lastest value  " << endl;
		cout << "5-delet any value  " << endl;
		cout << "6-sort linkedlist  " << endl;
		cout << "7-display linkedlist  " << endl;
		cout << "8-end program  " << endl;
		cout << "Please Enter number of your choise ::   ";
		int choise;
		cin >> choise;
		if (choise == 1) {
			cout << "please enter your value::   ";
			int number;
			cin >> number;
			list.append(number);
		}
		if (choise == 2) {
			cout << "please enter your value::   ";
			int number;
			cin >> number;
			cout << "please enter position of value::   ";
			int positionn;
			cin >> positionn;
			list.insertAt(number, positionn);
		}
	
		if (choise == 4) {
			list.Delete();
		}
		if (choise == 5) {
			cout << "please enter position of value for delete::   ";
			int positionn;
			cin >> positionn;
			list.DeleteAt(positionn);
		}
		if (choise == 6) {
			list.sort();
		}
		
		if (choise == 8) {
			return 0;
		}
		else if(choise>8||choise<1) {
			cout << "    Error::::::::::      ";
		}
		system("cls");
		if (choise == 7) {
			list.displaay();
		}
		if(choise!=7){
		list.display();
		}
		cout << endl;
		if (choise == 3) {
			cout << "please enter your value for search::   ";
			int number;
			cin >> number;
			list.search(number);
		}
		
	}

	system("pause");
	
}