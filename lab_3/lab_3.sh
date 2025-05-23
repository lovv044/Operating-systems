#!/bin/bash

# Проверка аргументов командной строки
if [ $# -eq 0 ]; then
    echo "Ошибка: необходимо указать путь к директории" >&2
    echo "Использование: $0 <директория>" >&2
    exit 1
fi

# Основные параметры
SOURCE_DIR="$1"
PARENT_DIR=$(dirname "$SOURCE_DIR")
DIR_BASE=$(basename "$SOURCE_DIR")
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_NAME="${DIR_BASE}_archive_${TIMESTAMP}"
BACKUP_PATH="${PARENT_DIR}/${BACKUP_NAME}"

# Проверка доступности исходной директории
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: директория '$SOURCE_DIR' недоступна или не существует" >&2
    exit 1
fi

# Создание резервной директории
echo "Создание архива изображений в $BACKUP_PATH"
if ! mkdir -p "$BACKUP_PATH"; then
    echo "Ошибка: невозможно создать директорию для архива" >&2
    exit 1
fi

# Поиск и копирование графических файлов
FILE_COUNT=0

while IFS= read -r -d '' image; do
    if cp -n "$image" "$BACKUP_PATH/"; then
        ((FILE_COUNT++))
    fi
done < <(find "$SOURCE_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.heic" \) -print0 2>/dev/null)

# Обработка результатов
if [ $FILE_COUNT -eq 0 ]; then
    echo "Внимание: графические файлы не найдены"
    rmdir "$BACKUP_PATH" 2>/dev/null
    exit 1
else
    echo "Архивация завершена успешно"
    echo "Количество сохранённых файлов: $FILE_COUNT"
    echo "Расположение архива: $BACKUP_PATH"
fi

exit 0