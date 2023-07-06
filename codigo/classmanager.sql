CREATE TABLE login(id_login INT identity(1,1) PRIMARY KEY,
                   CONSTRAINT nombre_apellido FOREIGN KEY (nombre_apellido) REFERENCES docente(nombre_apellido),
                   contraseña INT);

CREATE TABLE docente(nombre_apellido VARCHAR(10),
                    id_user INT identity(1,1) PRIMARY KEY);

CREATE TABLE trabaja(CONSTRAINT usuario FOREIGN KEY (id_user) REFERENCES docente(id_user),
                     CONSTRAINT escuela FOREIGN KEY (id_escuela) REFERENCES escuela(id_escuela));

CREATE TABLE escuelas(id_escuela INT identity(1,1) PRIMARY KEY,
                      nom_escuela VARCHAR);

CREATE TABLE tiene(CONSTRAINT cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
                   CONSTRAINT escuelas FOREIGN KEY (id_escuela) REFERENCES escuelas(id_escuela));

CREATE TABLE cursos(id_curso INT identity(1,1) PRIMARY KEY,
                    horario TIME,
                    division VARCHAR,
                    turno VARCHAR);

CREATE TABLE alumnos(id_alumno INT identity(1,1) PRIMARY KEY,
                     CONSTRAINT id_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
                     nombre_apellido VARCHAR(50));

CREATE TABLE pertenecen(CONSTRAINT cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
                        CONSTRAINT alumnos FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno));

CREATE TABLE materias(id_materias INT identity(1,1) PRIMARY KEY,
                      nom_materia VARCHAR,
                      horario TIME,
                      dia_materia DATE);

CREATE TABLE tiene(CONSTRAINT cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
                   CONSTRAINT materias FOREIGN KEY (id_materias) REFERENCES materias(id_materias));

CREATE TABLE actividades(id_actividad INT identity(1,1) PRIMARY KEY,
                         calif VARCHAR,
                         nom_actividad VARCHAR,
                         fecha_entrega DATETIME);

CREATE TABLE asistencia(id_asist INT identity(1,1) PRIMARY KEY,
                        fecha_asist DATE);

CREATE TABLE realizan(CONSTRAINT actividades FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad),
                      CONSTRAINT materias FOREIGN KEY (id_materias) REFERENCES materias(id_materias));

CREATE TABLE toman(CONSTRAINT materias FOREIGN KEY (id_materias) REFERENCES materias(id_materias),
                   CONSTRAINT asistencia FOREIGN KEY (id_asist) REFERENCES asistencia(id_asist));

CREATE TABLE classmanager(id_aplicacion INT identity(1,1) PRIMARY KEY,
                          CONSTRAINT materias FOREIGN KEY (id_materias) REFERENCES materias(id_materias),
                          CONSTRAINT asistencia FOREIGN KEY (id_asist) REFERENCES asistencia(id_asist),
                          CONSTRAINT cursos FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
                          CONSTRAINT actividades FOREIGN KEY (id_actividad) REFERENCES actividades(id_actividad),
                          CONSTRAINT escuelas FOREIGN KEY (id_escuela) REFERENCES escuelas(id_escuela),
                          CONSTRAINT usuario FOREIGN KEY (id_user) REFERENCES docente(id_user),
                          CONSTRAINT escuela FOREIGN KEY (id_escuela) REFERENCES escuela(id_escuela),
                          CONSTRAINT alumnos FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno));

