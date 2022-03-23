import { TouchIDError } from './errors';

export default {
  isSupported(config) {
    return Promise.resolve(false);
  },

  authenticate(reason, config) {
    return Promise.reject(createError(config, new Error('not work in web')));
  }
};

function createError(config, error) {
  return new TouchIDError('Touch ID Error', error);
}
