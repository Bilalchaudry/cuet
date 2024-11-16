const path = require("path");
const webpack = require("webpack");
const mode = process.env.NODE_ENV === 'development' ? 'development' : 'production';

// Extracts CSS into .css file
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');

module.exports = {
    entry: {
        // Your main entry points for JavaScript and CSS
        application: [
            "./app/javascript/application.js",
            "./app/assets/stylesheets/application.css",  // Include your CSS
        ],
        // custom: './app/assets/stylesheets/custom.scss', // Keep separate custom.scss entry if needed
    },
    module: {
        rules: [
            // Add rule for SCSS/CSS handling
            {
                test: /\.(sa|sc|c)ss$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
            },
        ],
    },
    resolve: {
        extensions: ['.js', '.jsx', '.scss', '.css'],
    },
    devtool: 'source-map', // for debugging
    output: {
        filename: "[name].js",  // Outputs JS with entry point name
        sourceMapFilename: "[file].map", // Outputs source maps
        chunkFormat: "module", // Use module chunk format
        path: path.resolve(__dirname, 'app/assets/builds'), // Ensure output is placed in assets/builds
    },
    plugins: [
        new RemoveEmptyScriptsPlugin(),  // Removes empty JS files if no corresponding CSS
        new MiniCssExtractPlugin({
            filename: '[name].css', // Outputs CSS file with entry name
        }),
        new webpack.optimize.LimitChunkCountPlugin({
            maxChunks: 1,  // Limits number of chunks to avoid multiple JS files
        }),
    ],
    optimization: {
        moduleIds: 'deterministic', // Ensures better caching with stable module IDs
    },
};
