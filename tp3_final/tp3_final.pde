//link al video:https://youtu.be/q1dfODFmILc
int tamañoCuadro = 40; 
int numCuadros = 20;
boolean interactivo = false; 
PImage ilusion; 

void setup() {
  size(800, 400);
  background(255);
  noLoop(); 
  ilusion = loadImage("ilusion.jpeg");
}

void draw() {
  background(255);
  image(ilusion, width / 2 - ilusion.width, 0); 
  for (int i = width / 2; i < width; i += tamañoCuadro) {
    for (int j = 0; j < height; j += tamañoCuadro) { 
     
      fill(randomColor());
      rect(i, j, tamañoCuadro, tamañoCuadro); 

      int tipoForma = obtenerTipoForma(j, i); 
      int tamañoForma = tamañoCuadro / 2; 

      // Dibujar forma dentro del cuadro
      if (tipoForma == 0) {
        fill(randomColor()); 
        ellipse(i + tamañoCuadro / 2, j + tamañoCuadro / 2, tamañoForma, tamañoForma); // Dibujar círculo centrado en el cuadro
      } else {
        fill(randomColor()); 
        rect(i + tamañoCuadro / 4, j + tamañoCuadro / 4, tamañoForma, tamañoForma); // Dibujar cuadro centrado en el cuadro
      }
    }
  }
}


int obtenerTipoForma(int j, int i) {
  int fila = j / tamañoCuadro;
  int columna = i / tamañoCuadro - 10; 

  if (fila < 2) {
    // Fila 1 y 2: todos círculos
    return 0;
  } else if (fila < 5) {
    // Fila 3 a 5: dos círculos, seis cuadrados, dos círculos
    if (columna < 2 || columna > 7) {
      return 0; // Círculos
    } else {
      return 1; // Cuadrados
    }
  } else if (fila < 8) {
    // Fila 6 a 8: dos cuadrados, seis círculos, dos cuadrados
    if (columna < 2 || columna > 7) {
      return 1; // Cuadrados
    } else {
      return 0; // Círculos
    }
  } else {
    // Fila 9 y 10: todos cuadrados
    return 1;
  }
}


color randomColor() {
  return color(random(255), random(255), random(255));
}

void mousePressed() {
  cambiarTamañoCuadro(20); // Cambiar tamaño de los cuadros al tocar el mouse
  interactivo = true;
  calcularCantidadYTamanoCuadros(tamañoCuadro, numCuadros); // Calcular e imprimir la cantidad y el tamaño de los cuadros
  redraw();
}

void mouseReleased() {
  interactivo = false;
}

// Función propia que no retorna un valor y tiene parámetros propios
void cambiarTamañoCuadro(int nuevoTamaño) {
  tamañoCuadro = nuevoTamaño;
}

// Función propia que retorna un valor y tiene parámetros propios
String calcularCantidadYTamanoCuadros(int tamañoCuadro, int numCuadros) {
  String mensaje = "Cantidad de cuadros: " + numCuadros + ", Tamaño de cada cuadro: " + tamañoCuadro;
  println(mensaje);
  return mensaje;
}

// Función para reiniciar el programa al presionar una tecla
void keyPressed() {
  if (key == 'r' || key == 'R') {
    cambiarTamañoCuadro(40); // Restablecer el tamaño original de los cuadros
    numCuadros = 20;
    interactivo = false;
    redraw();
  }
}
