#include "../include/shared_utils.hpp"
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>

void setup_shared_memory(SharedData** shared, const char* name) {
    int fd = shm_open(name, O_CREAT | O_RDWR, 0666);
    ftruncate(fd, sizeof(SharedData));
    *shared = static_cast<SharedData*>(
        mmap(NULL, sizeof(SharedData), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0)
    );
    
    // Инициализация семафоров ДО fork()
    sem_init(&(*shared)->write_sem, 1, 1);  // Начинаем с записи
    sem_init(&(*shared)->read_sem, 1, 0);    // Чтение заблокировано
}

void cleanup_shared_memory(SharedData* shared, const char* name) {
    sem_destroy(&shared->write_sem);
    sem_destroy(&shared->read_sem);
    munmap(shared, sizeof(SharedData));
    shm_unlink(name);
}