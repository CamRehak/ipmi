int tamañoCuadro = 40; // tamaño de cada cuadro
int numCuadros = 20;
boolean interactivo = false; // Variable para habilitar/deshabilitar la interaccion con el mouse
PImage ilusion; // variable para la imagen

void setup() {
  size(800, 400);
  background(255);
  noLoop(); // El draw no se ejecuta automaticamente
  ilusion = loadImage("ilusion.jpg");
}

void draw() {
  background(255);
  image(ilusion, width / 2 - ilusion.width, 0); // posicion de la imagen
  for (int i = width / 2; i < width; i += tamañoCuadro) {
    for (int j = 0; j < height; j += tamañoCuadro) { // iterar sobre los cuadros
      fill(colorAleatorio()); // color del cuadro actual
      rect(i, j, tamañoCuadro, tamañoCuadro); // Dibujar el cuadro

      int tipoForma = int(random(2)); // Tipo de forma; 0 para circulo, 1 para cuadro
      int tamañoForma = tamañoCuadro / 2; // Tamaño de la forma (la mitad del tamaño del cuadro)

      // Dibujar forma dentro del cuadro
      if (tipoForma == 0) {
        fill(colorAleatorio()); // Establecer el color de la forma
        ellipse(i + tamañoCuadro / 2, j + tamañoCuadro / 2, tamañoForma, tamañoForma); // dibujar circulo centrado en el cuadro
      } else {
        fill(colorAleatorio()); // Establecer el color de la forma
        rect(i + tamañoCuadro / 4, j + tamañoCuadro / 4, tamañoForma, tamañoForma); // Dibujar cuadro centrado en el cuadro
      }
    }
  }
}

void mousePressed() {
  interactivo = true;
  redraw();
}

void mouseReleased() {
  interactivo = false;
}

// Funcion propia que no retorna un valor y tiene parametros propios
void cambiarTamañoCuadro(int nuevoTamaño) {
  tamañoCuadro = nuevoTamaño;
}

// Funcion propia que retorna un valor y tiene parametros propios
int obtenerNumeroCuadros(int nuevoNumero) {
  numCuadros = nuevoNumero;
  return numCuadros;
}

// Funcion para reiniciar el programa al presionar una tecla
void keyPressed() {
  if (key == 'r' || key == 'R') {
    tamañoCuadro = 48;
    numCuadros = 20;
    interactivo = false;
    loop();
  }
}

// Funcion para obtener un color aleatorio
color colorAleatorio() {
  return color(random(255), random(255), random(255));
}
