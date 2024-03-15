#!/bin/bash

if [ "$1" = "--date" || "$1" = "-d" ]; then
  echo "Dzisiejsza data: $(date +%Y-%m-%d)"
elif [ "$1" = "--logs" || "$1" = "-l" ]; then
  if [ -z "$2" ]; then
    for i in {1..100}; do
      filename="log$i.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Nazwa skryptu: $0" >> $filename
      echo "Data: $(date +%Y-%m-%d)" >> $filename
    done
    echo "Utworzono $num_logs plików logx.txt"
  else
    num_logs=$2
    for i in $(seq 1 $num_logs); do
      filename="log$i.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Nazwa skryptu: $0" >> $filename
      echo "Data: $(date +%Y-%m-%d)" >> $filename
    done
    echo "Utworzono $num_logs plików logx.txt"
  fi
elif [ "$1" = "--help" || "$1" = "-h" ]; then
  echo "Użycie: $0 --date || --logs <liczba plików> || --help"
  echo "  --date lub -d                                  Wyświetla dzisiejszą datę."
  echo "  --logs <liczba plików> lub -l <liczba plików>  Tworzy określoną liczbę plików logx.txt."
  echo "  --help lub -h                                  Wyświetla krótką pomoc."
  echo "  --init                                         Klonuje całe repo do katalogu, w którym skrypt został uruchomiony."
  echo "  --error <liczba plików> lub -e <liczba plików> Tworzy określoną liczbę plików errorx.txt."

elif [ "$1" = "--init" ]; then
  git clone https://github.com/mikolajrajter/lab4nowy.git
  export PATH=$PATH:$(pwd)
elif [ "$1" = "--error" || "$1" = "-e" ]; then
  if [ -z "$2" ]; then
    for i in {1..100}; do
      filename="error$i.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Nazwa skryptu: $0" >> $filename
      echo "Data: $(date +%Y-%m-%d)" >> $filename
    done
    echo "Utworzono $num_logs plików logx.txt"  else
    num_errors=$2
    for i in $(seq 1 $num_errors); do
      filename="error$i.txt"
      echo "Nazwa pliku: $filename" > $filename
      echo "Nazwa skryptu: $0" >> $filename
      echo "Data: $(date +%Y-%m-%d)" >> $filename
    done
    echo "Utworzono $num_errors plików errorx.txt"
  fi
else
  echo "Użycie: $0 --date || --logs <liczba plików> || --help"
fi