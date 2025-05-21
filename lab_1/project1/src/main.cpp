#include <iostream>
#include "math_utils.hpp" // Подключаение заголовока

int main() {
    int num = 5;
    std::cout << "Factorial of " << num << " is " 
              << MathUtils::factorial(num) << std::endl;
    return 0;
}