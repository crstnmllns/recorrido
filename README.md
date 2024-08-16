Proyecto de Gestión de Turnos y Disponibilidades
Este proyecto es una aplicación de gestión de turnos y disponibilidades, desarrollada con Ruby on Rails 7.2 y Ruby 3.1.2, utilizando PostgreSQL como base de datos. La aplicación permite a los administradores gestionar ingenieros y turnos, y a los ingenieros gestionar su disponibilidad.

Tecnologías Utilizadas
Ruby on Rails 7.2
Ruby 3.1.2
PostgreSQL para la base de datos
Funcionalidades Implementadas
1. Sistema de Autenticación Básica
Se implementó un sistema de autenticación que permite a los usuarios iniciar sesión como administradores o ingenieros. Dependiendo del rol, los usuarios tienen acceso a diferentes funcionalidades:

Administrador:
Crear, actualizar y eliminar ingenieros.
Acceder a una vista administrativa donde se gestionan los usuarios y los turnos.
Ingeniero:
Acceder a una vista donde pueden gestionar su disponibilidad para los turnos asignados.
2. Gestión de Turnos y Disponibilidades
Creación de Turnos:

Los turnos son generados automáticamente según los servicios y las semanas seleccionadas por el administrador.
Asignación de Ingenieros:

Los administradores pueden asignar ingenieros a los turnos disponibles.
Los ingenieros pueden ver y actualizar su disponibilidad para los turnos asignados.
3. Base de Datos y Asociaciones
Se crearon varias tablas en la base de datos para gestionar los diferentes aspectos de la aplicación:

Usuarios (users):
Roles de admin e ingeniero.
Servicios (services):
Define los servicios que la empresa ofrece y sus horas contractuales.
Turnos (shifts):
Define los turnos disponibles para cada servicio y semana.
Disponibilidades (availabilities):
Registro de las disponibilidades de los ingenieros para cada turno.
Cada tabla fue asociada correctamente para reflejar las relaciones necesarias entre ingenieros, turnos, servicios, y semanas.

Estructura del Proyecto
El proyecto está estructurado siguiendo las mejores prácticas de Rails:

Modelos: Representan las tablas y relaciones en la base de datos.
Controladores: Gestionan la lógica de la aplicación y la interacción entre las vistas y los modelos.
Vistas: Se implementaron vistas para los administradores y los ingenieros, incluyendo formularios para la gestión de usuarios y turnos.