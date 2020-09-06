// This source code is a part of Project Violet.
// Copyright (C) 2020. violet-team. Licensed under the Apache-2.0 License.

var r_auth = require('../auth/auth');

// This function is triggered when the user reads a specific article.
module.exports = async function view(req, res, next) {
  if (!r_auth.auth(req)) {
    res.status(403).type('json').send({'msg':'forbidden'});
    return; 
  }

  if (req.body['no'] == null) {
    res.status(400).type('json').send({'msg':'bad request'});
    return;
  }

  var no = parseInt(req.body['no']);

  if (isNaN(no)) {
    res.status(400).type('json').send({'msg':'bad request'});
    return;
  }
};