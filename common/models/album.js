'use strict';

module.exports = function(Album) {
    var albumFuncs = require('../models/albumCreate')
    albumFuncs.createAlbum(Albums)
    albumFuncs.uploadImage(Albums)
};
