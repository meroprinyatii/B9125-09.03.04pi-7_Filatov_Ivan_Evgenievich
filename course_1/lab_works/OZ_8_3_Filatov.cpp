#include <iostream>
#include <string>
using namespace std;

int main(){
	short int N,M;
	cout<<"Write N - quantity of days in the month: "; cin>>N;
	if ((N>31) or (N<28)){
		cout<<"Out of range"<<endl;
		return 0;
	}
	cout<<"Write  M - number of the first day of the month: "; cin>>M;
	if ((M>7) or (M<1)){
		cout<<"Out of range"<<endl;
		return 0;
	}
	int K=((N+M+5)/7);
	int month[K][7]={0};

	int row=0,col=M-1;
    for (int day=1; day<=N; day++) {
		month[row][col]=day;
        if ((++col)==7) {
            col=0;
            row++;
        }
    }
    cout<<"MON  TUE  WED  THU  FRI  SAT  SUN"<<endl;
	for (int i=0;i<K;i++){
			for (int j=0;j<7;j++){
				if (month[i][j]<10) cout<<" "<<month[i][j]<<"   ";
				else cout<<month[i][j]<<"   ";
		}
		cout<<endl;	
	}
	return 0;
}
