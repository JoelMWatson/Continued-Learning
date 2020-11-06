import { hash } from 'bcryptjs';

import bcrypt from 'bcryptjs';

const hashPassword = (password) => {
  if (password.length < 8) {
    throw new Error('Password must be 8 characters or longer');
  }

  return await bcrypt.hash(password, 8);
};

export default hashPassword;
