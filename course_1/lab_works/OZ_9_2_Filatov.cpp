#include <iostream>
using namespace std;
int main() {
    unsigned int X;
    int n;

    cout << "Input unsigned int X: "; cin >> X;
    cout << "Enter the number of bits for a left cyclic shift: "; cin >> n;

    const int BITS = sizeof(unsigned int) * 8;
    n=n%BITS;

    unsigned int result;
    if (n == 0) result = X;
    else result = (X << n) | (X >> (BITS - n));

    cout << "Result in decimal: " << result << endl;
    cout << "Result in binary: ";
    for (int i = BITS - 1; i >= 0; i--) {
        cout << ((result >> i) & 1);
        if (i % 8 == 0 && i != 0) cout << '.';
    }
    cout << endl;

    return 0;
}
