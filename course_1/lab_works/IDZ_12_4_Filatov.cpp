#include <iostream>
using namespace std;
int main() {
    unsigned int F; // достаточно для хранения 16-битной информации
    cout << "Input F: "; cin >> F;
    // Номер группы: биты 8..15
    unsigned int group_number = (F >> 8) & 0xFF;
    // Проверка условия:
    // (трансфер (бит 4) И багаж (бит 3)) ИЛИ (экскурсия (бит 1) И питание (бит 0))
    bool condition = ((F & (1 << 4)) && (F & (1 << 3))) || ((F & (1 << 1)) && (F & (1 << 0)));

    // Вывод результатов
    cout << "Number of the group: " << group_number << endl;
    cout << "The need for transfers and additional luggage spaces at the same time, or there is a tour program and meals provided simultaneously: "
              << (condition ? "Yes" : "No") << std::endl;
    return 0;
}
