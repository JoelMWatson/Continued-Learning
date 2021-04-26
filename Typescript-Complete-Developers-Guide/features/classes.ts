class Vehicle {

  constructor(public color: string) { }

  driving(): void {
    console.log("CHuggchugchoochoo")
  }

  protected honk(): void {
    console.log('Beep')
  }
}

const vehicle = new Vehicle('blue');
console.log(vehicle.color);
vehicle.driving();

class Car extends Vehicle {
  constructor(public wheels: number, color: string) {
    super(color);
  }
  
  private drive(): void {
    console.log("Vroooom");
  }

  startDriving() {
    this.drive();
    this.honk();
  }
}

const car = new Car(4, 'red');
car.startDriving();
// car.honk();
