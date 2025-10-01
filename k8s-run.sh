#!/bin/bash
set -e

# Путь к корню проекта
ROOT_DIR=$(pwd)

# Найти все файлы с расширением .yaml или .yml рекурсивно
MANIFESTS=$(find "$ROOT_DIR" -type f \( -name "*.yaml" -o -name "*.yml" \))

if [ -z "$MANIFESTS" ]; then
    echo "Манифесты Kubernetes не найдены!"
    exit 1
fi

# Применяем каждый манифест
for FILE in $MANIFESTS; do
    kubectl apply -f "$FILE"
done

echo "Все манифесты успешно применены!"