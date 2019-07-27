'use strict';

module.exports = function(Album) {
    var albumFuncs = require('../models/albumCreate')
    albumFuncs.createAlbum(Album)
    albumFuncs.uploadImage(Album)
};
