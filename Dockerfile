# Usar una imagen base de Node para construir la aplicación
FROM node:14 AS build
WORKDIR /app
COPY ./ /app/
RUN npm install && npm run build --prod

# Usar Nginx para servir la aplicación
FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
