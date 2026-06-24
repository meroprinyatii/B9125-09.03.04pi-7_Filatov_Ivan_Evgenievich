#include <iostream>
#include <climits>
using namespace std;

/*В качестве тестового множетсва были выбраны числа по методу граничных значений:
 * 0;1;-1;-5;2;10;19;20;21 */

unsigned long long WhileFact(unsigned long long n, unsigned long long &stop) { 
    if ((n==0) or (n==1)) {
        stop=n;
        return 1;
    }
    else {
    unsigned long long fact=1;
    unsigned long long i=1;
    while ((i<=n) and (fact<=(ULLONG_MAX/i))) {
        fact=fact*i;
        i++;
    }
    if (i>n) stop=n;
    else stop=i-1;
    return fact;
	}
}	

unsigned long long DoWhileFact(unsigned long long n, unsigned long long &stop) {
    if ((n==0) or (n==1)) {
        stop=n;
        return 1;
    }
    else {
    unsigned long long fact=1;
    unsigned long long i=1;
    bool overflow=false;
    do {
        if (not(overflow)) {
            if (fact>ULLONG_MAX/i) overflow=true;
            else {
                fact=fact*i;
                i++;
            } 
        } 
    } 
    while ((i<=n) and (not(overflow)));
    stop=i-1;
    if (stop>n) stop=n;
    return fact;
	}
}

unsigned long long ForFact(unsigned long long n, unsigned long long &stop) {
    if ((n==0) or (n==1)) {
        stop=n;
        return 1;
    }
    else {
    unsigned long long fact=1;
    unsigned long long i;
    for (i=1; ((i<=n) and (fact<=(ULLONG_MAX/i))); fact=fact*i, i++);
    stop=i-1;
    if (stop>n) stop=n;
    return fact;
	}
}

int main() {
    long long input;
    cout << "Write your number: "; 
    cin >> input;
    if (input<0) {
        cout<<"Out of range"<<endl;
        return 0;
    }
    else {
    unsigned long long n=input;
    unsigned long long stop1,stop2,stop3;
    unsigned long long res1=WhileFact(n,stop1);
    unsigned long long res2=DoWhileFact(n,stop2);
    unsigned long long res3=ForFact(n,stop3);
    
    if (stop1<n) cout << "while: factorial computed up to " << stop1 << " (" << res1 << ")" << ";" << endl;
    else cout << "while: " << res1 << endl;

    if (stop2<n) cout << "do-while: factorial computed up to " << stop2 << " (" << res2 << ")" << ";" << endl;
    else cout << "do-while: " << res2 << endl;

    if (stop3<n) cout << "for: factorial computed up to " << stop3 << " (" << res3 << ")" << ";" << endl;
    else cout << "for: " << res3 << endl;

    return 0;
	}
}
