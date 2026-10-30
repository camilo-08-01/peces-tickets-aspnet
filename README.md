# PeCe's: sistema de gestión de tickets

Aplicación web de gestión de tickets de soporte, desarrollada en **C# y ASP.NET Web Forms (.NET Framework 4.8)** con **arquitectura de tres capas**. Proyecto del ramo Programación I del programa Analista Programador (IPLACEX).

## Arquitectura

| Capa | Proyecto | Responsabilidad |
| --- | --- | --- |
| Presentación | `PECEs` (Web Forms + Master Page) | Páginas de inicio, listado, detalle, alta y actualización de tickets. |
| Negocio | `Negocio` | Modelo (`Ticket`, `Cliente`, `PersonaNatural`, `Empresa`) y `TicketController` con Create, Read, ReadAll, Update, Delete y Search. |
| Datos | `Datos` | Entidades de persistencia y colección estática de tickets. |

La capa de negocio transforma los objetos del modelo a entidades de datos y viceversa, de modo que la interfaz no depende de cómo se almacenan.

## Qué muestra

- Herencia y polimorfismo: un ticket pertenece a una persona natural o a una empresa (`Cliente` → `PersonaNatural` / `Empresa`).
- Separación de responsabilidades en tres proyectos.
- CRUD y búsqueda con filtro en la capa de negocio.
- Master Page y navegación en Web Forms.

## Limitaciones

Los datos se guardan en una **lista en memoria** (`TicketEntityCollection`), así que se pierden al reiniciar la aplicación. Es un proyecto académico: no usa base de datos.

## Cómo ejecutarlo

1. Abre `PECEs.slnx` en Visual Studio 2022 o superior.
2. Restaura los paquetes NuGet (se hace automáticamente al compilar).
3. Ejecuta con IIS Express (F5).
