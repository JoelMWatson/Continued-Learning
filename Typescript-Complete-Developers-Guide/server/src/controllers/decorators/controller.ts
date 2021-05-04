import 'reflect-metadata';
import { AppRouter } from '../../AppRouter';
import { Methods } from './Methods';
import { MetadataKeys } from './Metadata';
import { NextFunction, Request, RequestHandler, Response } from 'express';

function bodyValidators(keys: string): RequestHandler {
  return function(req: Request, res: Response, next: NextFunction) {
    if (!req.body) {
      res.status(422).send('Invalid Request');
      return;
    }

    for (let key of keys) {
      if (!req.body[key]) {
        res.status(422).send('Invalid Request');
        return;
      }
    }

    next();
  }
}

export function controller(prefix: string) {
  return function(target: Function) {
    const router = AppRouter.getInstance();
    
    for (let key in target.prototype) {
      const handler = target.prototype[key];
      const path = Reflect.getMetadata(MetadataKeys.Path, 
        target.prototype, key);
      const method: Methods = Reflect.getMetadata(MetadataKeys.Method, 
        target.prototype, key);
      const middlewares = Reflect.getMetadata(MetadataKeys.Middleware, 
        target.prototype, key) || [];
      const reqBodyProps = Reflect.getMetadata(MetadataKeys.Validator,
        target.prototype, key) || [];

      const validator = bodyValidators(reqBodyProps);

      if (path) {
        router[method](prefix + path, ...middlewares, validator, handler);
      }
    }
  }
}