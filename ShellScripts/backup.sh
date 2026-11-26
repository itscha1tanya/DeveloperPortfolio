#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
    echo "Backup created successfully!"
    echo "Backup file: $BACKUP_FILE"
    echo "Backup size: $SIZE"
    echo "$(date): SUCCESS - $BACKUP_FILE ($SIZE)" >> "$BACKUP_DIR/backup.log"
else
    echo "Backup failed!"
    echo "$(date): FAILED - $SOURCE" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
