-- Tabla: Usuarios
CREATE TABLE Usuarios (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo_documento ENUM('cc', 'ti', 'ce', 'pp') NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('contributivo', 'subsidiado') NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Tabla: Doctores
CREATE TABLE Doctores (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    direccion VARCHAR(255),
    calificacion_promedio FLOAT DEFAULT 0,
    numero_calificaciones INT DEFAULT 0
);

-- Tabla: Citas
CREATE TABLE Citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    doctor_id INT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado ENUM('confirmada', 'cancelada', 'completada') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Usuarios(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id)
);

-- Tabla: Calificaciones
CREATE TABLE Calificaciones (
    calificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    doctor_id INT,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    comentario TEXT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Usuarios(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id)
);

-- Tabla: Especialidades
CREATE TABLE Especialidades (
    especialidad_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla: Disponibilidad
CREATE TABLE Disponibilidad (
    disponibilidad_id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_id INT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (doctor_id) REFERENCES Doctores(doctor_id)
);
