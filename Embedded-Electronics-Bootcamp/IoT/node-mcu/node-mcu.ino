#include "env.h"

#include<PubSubClient.h>
#include<ESP8266WiFi.h>

unsigned long lastPub = 0;
unsigned long pubTime = 3000;

// Create a callback function 
void callback(char *topic, byte *payload, unsigned int len)
{
  Serial.print("MQTT Message recieved: [");
  Serial.print(topic);
  Serial.println("]");
  Serial.println(payload[0]);
  if (payload[0] == 49) // '1' character
  {
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else if (payload[0] == 50) // '2' character
  {
    digitalWrite(LED_BUILTIN, LOW);
  }
}


// Create WiFiClient
WiFiClient NodeMcuClient;

// create MQTT PubSub Relationship
//                 Server/Broker    Port      Event       Router
PubSubClient client(MQTT_SERVER, MQTT_PORT, callback, NodeMcuClient);

void setup() {
  Serial.begin(9600);
  delay(10);
  Serial.println("Connecting to...");
  Serial.println(MY_SSID);
  pinMode(2, OUTPUT);

  WiFi.begin(MY_SSID, MY_PASS);

  while(WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  
  Serial.println("Wifi connected!");
  
  int status = client.connect("bd1c321f030e4c358c2b9dab4647783a.s2.eu.hivemq.cloud");

  if (status == 1) 
  {
    Serial.println("MQTT connected!");
    client.subscribe("INTERNAL_LED");
  }
}

void loop() {
  if (!client.connected())
  {
    int status = client.connect("bd1c321f030e4c358c2b9dab4647783a.s2.eu.hivemq.cloud");
    if (status == 1) 
    {
      Serial.println("MQTT connected!");
      client.subscribe("INTERNAL_LED");
    }
  }
  // listen
  client.loop();

  // Publish at set intervals rather than constantly
  unsigned long now = millis(); // <-- read internal clock
  if (now - lastPub > pubTime)
  {
    // status of led
    bool led = digitalRead(2);
    
    lastPub = now;
    int Pot = analogRead(A0);
    // Cast int to C++ String then convert from C++ to C string
    client.publish("POT_VALUE", String(Pot).c_str());
    client.publish("LED_STATUS", String(led).c_str());
  } 
}
