# dxf2png

dxf2png was originally forked from [LibreCAD](https://github.com/LibreCAD/LibreCAD). Most of the unrelated code were stripped out. The goal is to allow you to convert DXF file to graphic format headlessly. It still relies on QT system for passing messages to draw things. It is the central piece of the LibreCAD UI framework. The implementation of exporting graphic files is simply a specialized implementation of the interface. It is possible to get rid of QT dependency but may require significant work. The workaround here is to invoke the binary using xvfb-run. Support png, bmp, jpg and svg. Other export types supported by LibreCAD can also be extended.

# Getting started

## Build docker image

docker build --rm -t dxf2png .

## Запуск в Linux

./convert.sh dxf_path dest_path

Path needs to be relative to current directory

Example:

./convert.sh data/test.dxf test.png

Additional parameters are supported to specify background color (png), dimension, the whitelist/blacklist of dxf layers. Check comment in convert.sh for detail.

## Запуск в Windows

***Если при сборке образа возникают проблемы с .sh файлами - задать всем .sh-файлам формат конца строки Linux.
В Notepad++: Правка - Формат конца строк - Преобразовать в Unix (LF)***

1. Создать Volumes:
`docker volume create dxf`

2. Скопировать DXF-файл `1.dxf` в Volume для dxf:
   `\\wsl.localhost\docker-desktop-data\data\docker\volumes\dxf\_data`

3. Запустить команду:
`docker run --rm -v dxf:/data dxf2png bash -c "set -e; set -x;cp /data/1.dxf /tmp/src.dxf; xvfb-run -a /dxf2png/dxf2png /tmp/src.dxf /data/1.png white 800 600"`

4. Результат: файл `1.png` в папке рядом с исходным файлом.

Назначение параметров описано в файле [convert.sh](convert.sh)
