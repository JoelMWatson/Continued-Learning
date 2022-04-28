#include<ESP8266WiFi.h>

const char *ssid = "";
const char *pass ="";

void setup() {
  Serial.begin(9600);
  delay(10);
  Serial.println("Connecting to...");
  Serial.println(ssid);

  WiFi.begin(ssid, pass);

  while(WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("Wifi connected!");
}

void loop() {
  // put your main code here, to run repeatedly:

}
