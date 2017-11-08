# fmpxmlresult2nodeexpress
This is an XSLT stylesheet to convert from FileMaker's fmpxmlresult to JSON route node for express, no records involved.

This is a PoC( Proof of Concept )

Note adding a layout name in the FMPXMLRESULT export; before translating using this XSLT, will make the output more complete.

<img alt="[x] Format Using Layout will provoke the export to populate the LAYOUT-attribute" src="FormatUsingLayout.png" width="100%" max-width=1008>

How to use this file in terminal
---
```bash
$ xsltproc fmpxmlresult2nodeexpress.xslt test.xml > ~/projectname/route/view.js
```

For using this in FileMaker use File -> Export Records use filetype XML and point to the raw file on github for the [XSLT](https://raw.githubusercontent.com/TyrfingMjolnir/fmpxmlresult2nodeexpress/master/fmpxmlresult2nodeexpress.xslt)

If you do not like the verbs used for the calls you can have a look [here](http://stackoverflow.com/questions/630453/put-vs-post-in-rest) to do some qualified changes. Perhaps using patch instead of put for your UPDATE will be for the better?

Sample files
---
test.xml
```xml
<?xml version="1.0" encoding="utf-8"?>
<FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
  <ERRORCODE>0</ERRORCODE>
  <PRODUCT BUILD="03-22-2017" NAME="FileMaker" VERSION="ProAdvanced 16.0.1" />
  <DATABASE DATEFORMAT="M/d/yyyy" LAYOUT="contact" NAME="Untitled.fmp12" RECORDS="1" TIMEFORMAT="h:mm:ss a" />
  <METADATA>
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactActive" TYPE="NUMBER" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactCountry" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactEpost" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactID" TYPE="NUMBER" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactName" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactTown" TYPE="TEXT" />
    <FIELD EMPTYOK="YES" MAXREPEAT="1" NAME="contactZIP" TYPE="TEXT" />
  </METADATA>
  <RESULTSET FOUND="1">
    <ROW MODID="0" RECORDID="1">
      <COL>
        <DATA>1</DATA>
      </COL>
      <COL>
        <DATA>contactCountry</DATA>
      </COL>
      <COL>
        <DATA>contactEpost</DATA>
      </COL>
      <COL>
        <DATA>contactID</DATA>
      </COL>
      <COL>
        <DATA>contactName</DATA>
      </COL>
      <COL>
        <DATA>contactTown</DATA>
      </COL>
      <COL>
        <DATA>contactZIP</DATA>
      </COL>
    </ROW>
  </RESULTSET>
</FMPXMLRESULT>
```

~/projectname/route/contact.js

```js
// To be called from app.js like this: app.use('/contact', require('./contact'));
const
  express = require( 'express' ),
  routernode  = express.Router();

// Create
routernode.post( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP POST query' );
});

// Read
routernode.get( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP GET query' );
});

// Update overwrite record
routernode.put( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP PUT query' );
});

// Update overwrite a selection of fields in a record
routernode.patch( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP PATCH query' );
});

// Delete
routernode.delete( '/:contactActive/:contactCountry/:contactEpost/:contactID/:contactName/:contactTown/:contactZIP', function( req, res ) {
  res.send( 'You did a HTTP DELETE query' );
});

module.exports = routernode;
```

# fmpxmlresult2nodeexpressFullCRUD.xslt

This file loads every field/column as a potential parameter in the template, there's most likely no purpose to use all fields as parameters, however it's easier to delete those you do not need than to risk a typo.

License
=======

Copyright (c) 2015 Gjermund Gusland Thorsen, released under the MIT License.

All rights deserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

This piece of software comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
