# Base Image
FROM alpine

# Comandos al momento de construir Imagen
# Menos comandos RUN, menos capas de imagen = Contenedor mas liviano
RUN apk update && apk upgrade --available && \
 apk add --no-cache bash && \
 apk add --update python3 && \
 apk add mysql-client && \
 mkdir app

# Definir el directorio de trabajo de la imagen
WORKDIR /app

#Variable de Entorno
ENV MSG='IVAN'

#Copiar del host anfitrion al host invitado(ADD & COPY)
#ADD index.html .
#ADD ./*.html .
ADD . .

# Comandos al momentos de tener Imagen Construida
CMD python3 -m http.server 5000

# Comando para exponer los puertos
EXPOSE 5000