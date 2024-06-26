#!/bin/bash
sudo apt update
sudo apt install ltrace
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
git clone --depth=1 https://github.com/grisuno/LazyOwnInfiniteStorage.git ./modules_ext/lazyown_infinitestorage
chmod +x /modules_ext/lazyown_infinitestorage/install.sh
/modules_ext/lazyown_infinitestorage/
./install.sh
# URL del archivo a descargar
URL="https://raw.githubusercontent.com/grisuno/LazyOwnEncoderDecoder/main/lazyencoder_decoder.py"

# Nombre del archivo de destino
DEST_FILE="modules/lazyencoder_decoder.py"
if [[ -f "$DEST_FILE" ]]; then
    echo "El archivo $DEST_FILE ya existe. borrando..."
    rm -rf "$DEST_FILE"
fi

# Función para descargar con wget
download_with_wget() {
    wget -O "$DEST_FILE" "$URL"
}

# Función para descargar con curl
download_with_curl() {
    curl -o "$DEST_FILE" "$URL"
}

# Comprobar si wget está instalado
if command -v wget &> /dev/null; then
    echo "wget encontrado. Descargando con wget..."
    download_with_wget
# Si wget no está instalado, comprobar si curl está instalado
elif command -v curl &> /dev/null; then
    echo "wget no encontrado. Descargando con curl..."
    download_with_curl
else
    echo "Ni wget ni curl están instalados. Por favor, instala uno de ellos para continuar."
    exit 1
fi

# Comprobar si la descarga fue exitosa
if [[ -f "$DEST_FILE" ]]; then
    echo "Archivo descargado exitosamente: $DEST_FILE"
else
    echo "Error al descargar el archivo."
    exit 1
fi
