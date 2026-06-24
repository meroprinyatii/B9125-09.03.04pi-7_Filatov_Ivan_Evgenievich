#include <iostream>
#include <climits>
using namespace std;

//podschitat kol-vo edinic v chisle//
unsigned int represent(unsigned int x){
	unsigned int bits=sizeof(x)*8;
	unsigned int note=0;
	cout<<"Bits in original number: "<<sizeof(x)*8<<endl;
	for (int i=bits-1;i>=0;i--){
		cout<<((x>>i)&1);
		if (((x>>i)&1)==1) note++;
		if (((i%8)==0) and (i!=0)) cout<<".";
	}
	cout<<endl;
	return note;
}
int main(){
	unsigned int x;
	cin>>x;
	cout<<"Meaningful digits quantity: "<<represent(x);
	
}
