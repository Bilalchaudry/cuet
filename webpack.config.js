const path = require("path");
const webpack = require("webpack");
const mode = process.env.NODE_ENV === 'development' ? 'development' : 'production';

// Extracts CSS into .css file
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');

module.exports = {
    entry: {
        application: [
            "./app/javascript/application.js",
            "./app/assets/stylesheets/application.css",
        ],
    },
    module: {
        rules: [
            {
                test: /\.(sa|sc|c)ss$/i,
                use: [MiniCssExtractPlugin.loader, 'css-loader', 'sass-loader'],
            },
            {
                // Rule to handle images
                test: /\.(png|jpg|jpeg|gif|svg)$/i,
                type: 'asset/resource',
                generator: {
                    filename: 'images/[name][ext]', // Output images in an `images` folder
                },
            },
        ],
    },
    resolve: {
        extensions: ['.js', '.jsx', '.scss', '.css'],
    },
    devtool: 'source-map', // for debugging
    output: {
        filename: "[name].js",
        sourceMapFilename: "[file].map",
        chunkFormat: "module",
        path: path.resolve(__dirname, 'app/assets/builds'),
        publicPath: '/assets/', // Ensures assets are served from `/assets/`
    },
    plugins: [
        new RemoveEmptyScriptsPlugin(),
        new MiniCssExtractPlugin({
            filename: '[name].css',
        }),
        new webpack.optimize.LimitChunkCountPlugin({
            maxChunks: 1,
        }),
    ],
    optimization: {
        moduleIds: 'deterministic',
    },
};
