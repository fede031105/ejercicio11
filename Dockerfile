# Etapa de construcción (Build)
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa de ejecución (Run)
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
# Aquí copiamos el archivo exacto que vimos en tu captura anterior
COPY --from=build /app/target/ejercicio11-0.0.1-SNAPSHOT.jar app.jar
# Exponemos el puerto 8081 que configuraste en tu application.properties
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]