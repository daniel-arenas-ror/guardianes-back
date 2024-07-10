## Guardianes Informáticos

Con este proyecto queremos administrar las horas que los expertos informáticos van a estar atentos a cualquier novedad del sistema, marcando su disponibilidad y un algoritmo asignará los turnos a cada uno de los trabajadores.

## Modelos

[Modelos](https://miro.com/app/board/uXjVMZ6LvYo=/)

*Deal:*  Es el modelo donde se relaciona los contratos, horarios y trabajadores
*ScheduleWeek:* Donde guardamos los dias de la semana que se va a trabajar en determinado contrato y el rango de horas por cada dia
*Serivice:* Los diferentes servicios que se ofrecen
*Worker:* Los trabajadores encargados de los contratos
*Turns:* Los turnos generamos por contratos, estos turnos se van generando semana tra semana corriendo el job `rails turn:create_turn_next_week`
*TurnAvailability:* Se guardan que trabajadores estan disponibles para que turnos

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

```
rails s
```

Al ingresar a la URL `http://localhost:3000/admin/dashboard` te encontraras con el sistema de administración de los contratos y trabajadores
