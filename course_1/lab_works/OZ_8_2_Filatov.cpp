#include <iostream>
using namespace std;

int main() {
	int x;
	cout << "Write your number: "; 
	cin >> x;
	if (((x>=100) and (x<=999)) or ((x>=-999) and (x<=-100))) {
		if (x<0) x=-x;
		int hundreds=x/100;
		int tens=(x/10)%10;
		int units=x%10;
		
		char ch1=(char)hundreds+'0';
		char ch2=(char)tens+'0';
		char ch3=(char)units+'0';
		
		int sum=(int)ch1+(int)ch2+(int)ch3;
		cout << "Digits: " << ch1 << ", " << ch2 << ", " << ch3 << endl;
		cout << "ASCII codes: " << (int)ch1 << " + " << (int)ch2 << " + " << (int)ch3 << " = " << sum << endl;
		cout << "Checksum: " << sum << endl;
		return 0;
	}
	else {
		cout<<"Out of range"<<endl;
		return 0;
		}
}
