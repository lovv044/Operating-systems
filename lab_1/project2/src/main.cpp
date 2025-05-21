#include <iostream>
#include <sys/wait.h>
#include "math_utils.hpp"
#include "shared_utils.hpp"

int main() {
    const char* SHMEM_NAME = "/fact_shmem";
    SharedData* shared = nullptr;

    setup_shared_memory(&shared, SHMEM_NAME);

    pid_t pid = fork();
    if (pid == -1) {
        perror("fork failed");
        return 1;
    }

    if (pid > 0) {  // Родительский процесс
        sem_wait(&shared->write_sem);  // Захватываем семафор записи
        shared->value = 5;             // Пишем значение
        std::cout << "[Parent] Wrote value: " << shared->value << std::endl;
        sem_post(&shared->read_sem);  // Разрешаем чтение

        wait(nullptr);                 // Ждём завершения ребёнка
        cleanup_shared_memory(shared, SHMEM_NAME);
    } 
    else {          // Дочерний процесс
        sem_wait(&shared->read_sem);   // Ждём разрешения на чтение
        int n = shared->value;         // Читаем значение
        std::cout << "[Child] Factorial of " << n 
                  << " is " << MathUtils::factorial(n) << std::endl;
        sem_post(&shared->write_sem);  // Освобождаем для следующей записи
        exit(0);
    }

    return 0;
}