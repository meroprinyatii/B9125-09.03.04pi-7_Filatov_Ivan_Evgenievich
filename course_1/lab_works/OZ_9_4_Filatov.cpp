#include <iostream>
using namespace  std;

void printBinary(unsigned int num) {
    const int BITS = sizeof(num) * 8;
    for (int i = BITS - 1; i >= 0; i--) {
        cout << ((num >> i) & 1);
        if (i % 8 == 0 && i != 0) cout << '.';
    }
}

int main() {
    unsigned int X;
    cout << "Input unsigned int X: "; cin >> X;

    const int BITS = sizeof(X) * 8;

    cout << "Binary X: "; printBinary(X); cout << endl;

    unsigned int mask_odd_clear = 0;
    for (int i = 0; i < BITS; i++) if (i % 2 == 0) mask_odd_clear |= (1u << i);
   
    unsigned int X_no_odd = X & mask_odd_clear;
    cout << "After turning off the odd bits:" << endl;
    cout << "Decimal: " << X_no_odd << endl;
    cout << "Binary: "; printBinary(X_no_odd); cout << endl;

    unsigned int mask_even_set = 0;
    for (int i = 0; i < BITS; i++) if (i % 2 == 0) mask_even_set |= (1u << i);
    
    unsigned int X_even_on = X | mask_even_set;
    cout << "After enabling even bits" << endl;
    cout << "Decimal: " << X_even_on << endl;
    cout << "Binary: "; printBinary(X_even_on); cout << endl;

    unsigned int mask_toggle = 0;
    for (int i = 0; i < BITS; i++) if (i % 4 == 3) mask_toggle |= (1u << i);
    
    unsigned int X_toggled = X ^ mask_toggle;
    cout << "After switching every fourth bit" << endl;
    cout << "Decimal: " << X_toggled << endl;
    cout << "Binary: "; printBinary(X_toggled); cout << endl;

    int highest_bit = BITS - 1;
    cout << "The state of the four highest bits" << endl;
    for (int i = highest_bit; i > highest_bit - 4; i--) {
        bool is_set = (X >> i) & 1;
        cout << "bit " << i << " - " << (is_set ? "on" : "off") << endl;
    }

    return 0;
}
