## Guardianes Informáticos

Con este proyecto queremos administrar las horas que los expertos informáticos van a estar atentos a cualquier novedad del sistema, marcando su disponibilidad y un algoritmo asignará los turnos a cada uno de los trabajadores.

## Modelos

[Modelos](https://miro.com/app/board/uXjVMZ6LvYo=/)

*Deal:*  

## Instalación

Ruby version `3.2.2`

```
bundle install
```

En caso de poder crear la BD en Docker

```
docker-compose -f docker-compose.yml up -d
```

de no ser asi, duplicar el archivo .env.example y configurar las credenciales de la BD

para correr la aplicación

````
rails s
```

Al ingresar a la URL `http://localhost:3000/admin/dashboard` te encontraras con el sistema de administración de los contratos y trabajadores
