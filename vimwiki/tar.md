### tar:
| Флаг | Описание |
|------|----------|
| -c   | Создать новый архив |
| -x   | Распаковать архив |
| -v   | Показывать прогресс |
| -f   | Указать имя файла |
| -z   | Сжать/распаковать через gzip |
| -J   | Сжать/распаковать через xz |

## Примеры

### Создать архив `.tar.gz`
```bash
tar -czvf archive.tar.gz file1 file2 dir/

### Распаковать архив `.tar.gz`
tar -xzvf archive.tar.gz

### Посмотреть содержимое `.tar.gz` без распаковки
tar -tzvf archive.tar.gz

### Создать `.tar.gz`
tar -cJvf archive.tar.xz file1 file2
