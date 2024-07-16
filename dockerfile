# Paso 1: Elegir la imagen base
FROM ubuntu:22.04

# Paso 2: Actualizar el sistema
RUN apt-get update && apt-get upgrade -y

# Paso 3: Instalar Node.js
RUN apt-get install -y curl software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g strapi

# Paso 4: Configurar el entorno de trabajo
WORKDIR /app

# Paso 5: Copiar los archivos del proyecto al contenedor
COPY . /app

# Paso 6: Instalar los módulos de Node.js (incluyendo Strapi localmente)
RUN npm install

# Paso 7: Exponer el puerto
EXPOSE 1337

# Paso 8: Comando de inicio
CMD ["npm", "run", "develop"]