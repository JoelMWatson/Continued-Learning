import 'reflect-metadata';
import { Methods } from './Methods';
import { MetadataKeys } from './Metadata';
import { RequestHandler } from 'express';

interface RoutHandlerDescripter extends PropertyDescriptor {
  value?: RequestHandler
}

function routeBinder(method: string) {
  return function(path: string) {
    return function(target: any, key: string, desc: RoutHandlerDescripter) {
      Reflect.defineMetadata(MetadataKeys.Path, path, target, key);
      Reflect.defineMetadata(MetadataKeys.Method, method, target, key);
    };
  }
}

export const get = routeBinder(Methods.Get);
export const put = routeBinder(Methods.Put);
export const post = routeBinder(Methods.Post);
export const del = routeBinder(Methods.Del);
export const patch = routeBinder(Methods.Patch);

