FROM node:25

# Instalar libatomic
RUN apt-get update && \
    apt-get install -y libatomic1 && \
    apt-get clean

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos necesarios
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto de archivos
COPY index.js .
COPY users.json .

# Exponer el puerto
EXPOSE 3000

# Iniciar la app
CMD ["node", "index.js"]
