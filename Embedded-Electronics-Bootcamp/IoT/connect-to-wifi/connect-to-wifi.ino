#include<ESP8266WiFi.h>;
#include<BlynkSimpleEsp8266.h>
#include "env.h";

const char *ssid = MY_SSID;
const char *pass = MY_PASS;
char auth[]= BLYNK_AUTH_TOKEN;

void setup() {
  Serial.begin(9600);
  delay(10);
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("Connecting to...");
  Serial.println(ssid);

  WiFi.begin(ssid, pass);

  while(WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("Wifi connected!");
  Blynk.begin();
}

void loop() {
  Blynk.run();
}
