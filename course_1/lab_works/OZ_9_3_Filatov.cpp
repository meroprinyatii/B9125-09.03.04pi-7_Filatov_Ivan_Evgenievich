#include <iostream>
using namespace  std;
// Функция вывода числа в двоичном виде (старший бит слева)
void printBinary(unsigned int num) {
    const int BITS = sizeof(num) * 8;
    for (int i = BITS - 1; i >= 0; i--) {
        cout << ((num >> i) & 1);
        if (i % 8 == 0 && i != 0) cout << '.';
    }
}

int main() {
    unsigned int X;
    int n;

    cout << "Input unsigned int X: "; cin >> X;
    cout << "Input degree n (2^n): "; cin >> n;
    if (n < 0) {
        cout << "The degree cannot be negative." << endl;
        return 1;
    }

    // Увеличение в 2^n раз (сдвиг влево)
    unsigned int increased = X << n;
    // Уменьшение в 2^n раз (сдвиг вправо)
    unsigned int decreased = X >> n;

    cout << "The original X = " << X << std::endl;
    cout << "Binary X: "; printBinary(X); cout << endl;

    cout << "Increased (X * 2^" << n << ") = " << increased << endl;
    cout << "Binary (X * 2^" << n << ") = "; printBinary(increased); cout << endl;

    cout << "Decreased (X / 2^" << n << ") = " << decreased << endl;
    cout << "Binary (X * 2^" << n << ") = "; printBinary(decreased); cout << endl;

    return 0;
}
