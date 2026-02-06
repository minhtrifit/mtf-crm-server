type GenerateCodeOptions = {
  prefix?: string | false;
};

export const generateCode = (options: GenerateCodeOptions = {}) => {
  const { prefix = 'CODE' } = options;

  const random = Math.random().toString(36).substring(2, 6).toUpperCase();
  const time = Date.now().toString().slice(-4);

  const code = `${random}${time}`;
  return prefix ? `${prefix}-${code}` : code;
};
