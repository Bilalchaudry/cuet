const path = require('path');
const webpack = require('webpack');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
    entry: {
        application: [
            './app/javascript/packs/application.js',  // your main JavaScript file
            './app/javascript/stylesheets/application.scss',  // your SCSS file
            './app/assets/stylesheets/application.css',  // Optional: for traditional CSS
        ],
    },
    module: {
        rules: [
            {
                test: /\.(sa|sc|c)ss$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
            },
        ],
    },
    resolve: {
        extensions: ['.js', '.jsx', '.scss', '.css'],
    },
    devtool: 'source-map',  // for debugging
    output: {
        filename: '[name].js',
        sourceMapFilename: '[file].map',
        chunkFormat: 'module',
        path: path.resolve(__dirname, 'app/assets/builds'),
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
    ],
    optimization: {
        moduleIds: 'deterministic', // Ensures better caching with stable module IDs
    },
};
