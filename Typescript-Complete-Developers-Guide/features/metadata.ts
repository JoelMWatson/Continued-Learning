import 'reflect-metadata';

// const plane = {
//   color: 'red'
// };

// Reflect.defineMetadata('note', 'hi theree', plane);
// Reflect.defineMetadata('note', 'hi there', plane, 'color')

// const metaOnPlane = Reflect.getMetadata('note', plane);
// const metaOnPlaneColor = Reflect.getMetadata('note', plane, 'color');

// console.log(metaOnPlane);
// console.log(metaOnPlaneColor);

@controller
class Plane {
  color: string = 'red';

  @get('/fly')
  fly():void {
    console.log('vrrr');
  }
}

function get(path: string) {
  return function (target: Plane, key: string) {
    Reflect.defineMetadata('path', path, target, key);
  }
}

function controller(target: typeof Plane) {
  for (let key in target.prototype) {
    const path = Reflect.getMetadata('path', target.prototype, key);
    const middleware = Reflect.getMetadata('middleware', target.prototype, key);
    
    router.get(path, target.prototype[key]);
  }
}