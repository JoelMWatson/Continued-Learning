#include <Arduino_FreeRTOS.h>

#define rtDelay(v) {vTaskDelay(v/portTICK_PERIOD_MS)} // Sets delay in ms

const int LED_BLINK = 13;

void setup()
{
  // Create Blink Task
  xTaskCreate(
    taskBlink,    // Task
    "blink",      // Task name (max 8 char)
    128,          // Bytes of mem for stack size
    NULL,         // Pointer to a data structure to be passed to task
    1,            // Priority
    NULL,         // Task Handle
    );
    
  // Create First Serial Task
  xTaskCreate(
    taskSerial1,  // Task
    "serial",     // Task name (max 8 char)
    128,          // Bytes of mem for stack size
    NULL,         // Pointer to a data structure to be passed to task
    1,            // Priority
    NULL,         // Task Handle
    );
    
  // Create Second Serial Task
  xTaskCreate(
    taskSerial2,  // Task
    "serial",     // Task name (max 8 char)
    128,          // Bytes of mem for stack size
    NULL,         // Pointer to a data structure to be passed to task
    2,            // Priority
    NULL,         // Task Handle
    );

  BinarySemaphore = xSemaphoreCreateBinary();
  xSemaphoreGive(BinarySemaphore)

  Serial.Begin(9600);
}

void loop()
{
  // TODO
}

void taskBlink() 
{
  digitalWrite(LED_BLINK, HIGH);
  rtDelay(500);
  digitalWrite(LED_BLINK, LOW);
  vTaskDelay(500);
}

void taskSerial1()
{
  xSemaphoreTake(BinarySemaphore, portMAX_DELAY);
  Serial.println("Serial Task 1: Blinking is happening as a multi threaded program");
  xSemaphoreGive(BinarySemaphore);
  rtDelay(30);
}

void taskSerial2()
{
  xSemaphoreTake(BinarySemaphore, portMAX_DELAY);
  Serial.println("Serial Task 2: Blinking is happening as a multi threaded program");
  xSemaphoreGive(BinarySemaphore);
  rtDelay(30);
}
