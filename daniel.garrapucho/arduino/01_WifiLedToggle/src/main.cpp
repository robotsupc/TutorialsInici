#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

//Per testejar correctament el programa, crea una xarxa mobil amb el teu smartphone
// i utilitza les seves credencials aqui abaix. Per evitar errors, accedeix a la direccio
// IP assignada desde un altre mobil en comptes d'un ordinador.
const char* ssid = "ssid";
const char* password = "XXXXX";

ESP8266WebServer server(80);
bool led = false;
void webServerSetUp() {
  server.on("/", []() {
    server.send(200, "text/html", "<html><body><p>Hello World</p></body></html>");
  });
  server.on("/toggle",[]() {
    server.send(200, "text/html", "<html><body><p>Hello World</p></body></html>");
    led = !led;
  });
  server.begin();
}

void wifiSetup() {
  WiFi.begin(ssid,password);
  Serial.println("Hello World");
  while (WiFi.status()  != WL_CONNECTED) {
    Serial.print(".");
    delay(1000);
  }
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("");
    Serial.print("Connected to ");
    Serial.println(ssid);
    Serial.print("IP Address: ");
    Serial.println(WiFi.localIP());

    /* code */
  }
  else {
    Serial.println("Connection Error");

  }
}

void setup() {
  Serial.begin(38400);
  pinMode(2, OUTPUT); //D4
  wifiSetup();
  webServerSetUp();
    // put your setup code here, to run once:
}

void loop() {
  digitalWrite(2,!led); //D4
  server.handleClient();    // put your main code here, to run repeatedly:
}
