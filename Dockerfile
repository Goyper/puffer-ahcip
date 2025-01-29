# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Establece el directorio de trabajo
WORKDIR /app

# Actualiza e instala las dependencias necesarias
RUN apt-get update -y && \
    apt-get install -y curl gnupg && \
    curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash && \
    apt-get install -y pufferpanel && \
    pufferpanel configure && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Añade un usuario administrador a PufferPanel
# Sustituye el correo y contraseña por los valores que prefieras
RUN pufferpanel user add --email exampletotest050@gmail.com --name ahcip --password ahcip12345 --admin

# Expone el puerto 8080
EXPOSE 8080

# Comando para iniciar PufferPanel
CMD ["pufferpanel", "web", "--bind", "0.0.0.0:8080"]
