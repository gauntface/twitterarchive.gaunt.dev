const glob = require('glob');
const postcssPresetEnv = require('postcss-preset-env');
const postcssImport = require("postcss-import")
const cssnano = require('cssnano');
const mkdirp = require('mkdirp');

let plugins = [];

if (process.env.HUGO_ENVIRONMENT === 'production') {
    const varFiles = glob.sync('**/variables/*.css', {
        ignore: ['public/**'],
    });

    const themeAssets = glob.sync('themes/*/assets/', {
        ignore: ['public/**'],
    });

    plugins = [
        postcssImport({
            path: themeAssets,
        }),
        postcssPresetEnv({
            preserve: false,
            importFrom: varFiles,
            exportTo: 'public/__postcss/always.css',
        }),
        cssnano(),
    ];

    mkdirp.sync('public/__postcss/');
}

module.exports = {
    plugins,
}
