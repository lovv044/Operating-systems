#include <iostream>

class MathUtils {
public:
    static int factorial(int n) {
        return (n <= 1) ? 1 : n * factorial(n - 1);
    }
};

int main() {
    int num = 5;
    std::cout << "Factorial of " << num << " is " << MathUtils::factorial(num) << std::endl;
    return 0;
}