# fmpxmlresult2nodeexpress
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to JSON route node for express, no records involved.

This is a PoC( Proof of Concept )

Note that adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete. FileMaker does usually skip layout name on exports, if you know when FileMaker actually outputs the layout name, please enlighten me.

<img alt="[x] Format Using Layout will provoke the export to populate the LAYOUT-attribute" src="FormatUsingLayout.png" width="100%" max-width=1008>

How to use this file in terminal
---
xsltproc fmpxmlresult2nodeexpress.xslt YourTable.fmpxmlresult.xml > route/YourTable.js

'''bash
$ xsltproc fmpxmlresult2nodeexpress.xslt ../fmpxmlresult2nodeexpress2/test.xml
'''

'''js
const
  express = require( 'express' ),
  router  = express.Router();

router.post( '/view/:vintage/:wine/:wine2', function( req, res ) {
  res.send( req.params.vintage );
  res.send( req.params.wine );
  res.send( req.params.wine2 );
});

router.get( '/view/:vintage/:wine/:wine2', function( req, res ) {
  res.send( req.params.vintage );
  res.send( req.params.wine );
  res.send( req.params.wine2 );
});

router.put( '/view/:vintage/:wine/:wine2', function( req, res ) {
  res.send( req.params.vintage );
  res.send( req.params.wine );
  res.send( req.params.wine2 );
});

router.delete( '/view/:vintage/:wine/:wine2', function( req, res ) {
  res.send( req.params.vintage );
  res.send( req.params.wine );
  res.send( req.params.wine2 );
});
'''

License
=======

Copyright (c) 2015 Gjermund Gusland Thorsen, released under the MIT License.

All rights deserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

This piece of software comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
