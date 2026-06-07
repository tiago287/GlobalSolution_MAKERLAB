#include <Servo.h>

Servo servoBraco; 
Servo servoGarra; 

const int pinLed = 8;
const int pinServoBraco = 9;
const int pinServoGarra = 10;

void setup() {
  Serial.begin(9600);
  
  servoBraco.attach(pinServoBraco);
  servoGarra.attach(pinServoGarra);
  
  pinMode(pinLed, OUTPUT);

  servoBraco.write(90);
  servoGarra.write(0);

  Serial.println("Sistema Pronto!");
  Serial.println("Digite U (Up), D (Down), O (Open) ou C (Close).");
}

void loop() {
  if (Serial.available() > 0) {
    char comando = Serial.read();

    if (comando == '\n' || comando == '\r') {
      return; 
    }

    digitalWrite(pinLed, HIGH);

    switch (comando) {
      case 'U': 
      case 'u':
        servoBraco.write(180);
        Serial.println("Comando executado: UP (Braço para cima)");
        break;
        
      case 'D': 
      case 'd':
        servoBraco.write(90);
        Serial.println("Comando executado: DOWN (Braço para baixo)");
        break;
        
      case 'O': 
      case 'o':
        servoGarra.write(90);
        Serial.println("Comando executado: OPEN (Garra aberta)");
        break;
        
      case 'C': 
      case 'c':
        servoGarra.write(0);
        Serial.println("Comando executado: CLOSE (Garra fechada)");
        break;
        
      default:
        Serial.println("Comando Invalido! Use apenas U, D, O ou C.");
        break;
    }

    delay(200); 
    digitalWrite(pinLed, LOW); 
  }
}