module.exports = function (api) {
  // api.cache(true); // Remove this line to prevent the caching issue

  const validEnv = ['development', 'test', 'production'];
  const currentEnv = api.env();

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
        `Please specify a valid NODE_ENV or BABEL_ENV environment variable. Received: ${currentEnv}`
    );
  }

  return {
    presets: [
      [
        '@babel/preset-env',
        {
          useBuiltIns: 'entry',
          corejs: 3,
          modules: false, // "false" ensures Webpack handles modules
        },
      ],
    ],
    plugins: [
      '@babel/plugin-syntax-dynamic-import',
      '@babel/plugin-transform-runtime',
      '@babel/plugin-proposal-class-properties',
      '@babel/plugin-proposal-private-methods',
      '@babel/plugin-proposal-private-property-in-object',
    ],
  };
};
