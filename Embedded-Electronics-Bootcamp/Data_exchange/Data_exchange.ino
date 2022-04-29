#include <Arduino_FreeRTOS.h>
#include <queue.h>
#include "semphr.h"

#define rtDelay(v) {vTaskDelay(v/portTICK_PERIOD_MS)} // Sets delay in ms

QueueHandle_t xQueue;
SemaphoreHandle_t xBinarySemaphore;

typedef struct sensorInit
{
  char* sensorName;
  char* sensorType;
  int   sensorData;
  float sensorScale;
}

void setup() {
  Serial.begin(9600);
  xQueue = xQueueCreate(5, sizeof(sensorInit)); // Allocating space for queue
  xSemaphore = xSemaphoreCreateBinary();
  xTaskCreate(txTask, "Sender", 120, NULL, 1, NULL);
  xTaskCreate(rxTask, "Receiver", 120, NULL, 1, NULL);
  xSemaphoreGive(xSemaphore);
}

void loop() {}

void txTask(void*)
{
  // To send string
  // char *data[] ={"hi", "this", "is", "a", "string"};
  while (1)
  {
    // To send string
    // for (int i=0; i<5; i++) 
    // {
    //   xQueueSend(xQueue, &data, portMAX_DELAY);
    // }

    SensorInit UltraSonic;
    Ultrasonic.sensorName="Ultrasonic";
    Ultrasonic.sensorType="Analog";
    Ultrasonic.sensorData=55;
    Ultrasonic.sensorScale=4.2;
    // Check buffer
    int bufferCount = uxQueueMessageWaiting(xQueue);
    int availableBuffer = uxQueueSpacesAvailable(xQueue);

    xSemaphoreTake(xSemaphore, portMAX_DELAY);
    Serial.print("In Buffer: ");
    Serial.println(bufferCount);
    Serial.print("Avalable space: ");
    Serial.println(availableBuffer);  
    xSemaphoreGive(xSemaphore);  
  }
}

void rxTask (void*)
{
  sensorInit Ultrasonic;
  xQueueReceive(xQueue, &Ultrasonic, portMAX_DELAY);

  xSemaphoreTake(xSemaphore, portMAX_DELAY);
  Serial.print("Data Recieved: ");  
  Serial.print(" Name: ");
  Serial.print(Ultrasonic.sensorName);
  Serial.print(" Type: ");
  Serial.print(Ultrasonic.sensorType);
  Serial.print(" Data: ");
  Serial.print(Ultrasonic.sensorData);
  Serial.print(" Scale: ");
  Serial.println(Ultrasonic.sensorScale);
  xSemaphoreGive(xSemaphore);  
}
