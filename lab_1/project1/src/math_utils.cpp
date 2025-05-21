#include "../include/math_utils.hpp"

int MathUtils::factorial(int n) {
    return (n <= 1) ? 1 : n * factorial(n - 1);
}