<?xml version="1.0" encoding="utf-8"?>
<!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating NodeJS express route node from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" />
<xsl:template match="fmp:FMPXMLRESULT">
  <xsl:text>// To be called from app.js like this: app.use('/</xsl:text><xsl:value-of select="$tableName" /><xsl:text>', require('./</xsl:text><xsl:value-of select="$tableName" /><xsl:text>'));    
const
  express    = require( 'express' ),
  routernode = express.Router();
  
// Create
routernode.post( '</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>', function( req, res ) {
  res.send( 'You did a HTTP POST query' );
});

// Read
routernode.get( '</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>', function( req, res ) {
  res.send( 'You did a HTTP GET query' );
});

// Update overwrite record
routernode.put( '</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>', function( req, res ) {
  res.send( 'You did a HTTP PUT query' );
});

// Update overwrite a selection of fields in a record
routernode.patch( '</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>', function( req, res ) {
  res.send( 'You did a HTTP PATCH query' );
});

// Delete
routernode.delete( '</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>', function( req, res ) {
  res.send( 'You did a HTTP DELETE query' );
});

module.exports = routernode;
</xsl:text>
	</xsl:template>
	<xsl:template match="fmp:METADATA/fmp:FIELD"><xsl:text>/:</xsl:text><xsl:value-of select="@NAME"/></xsl:template>
  <xsl:variable name="databaseName">
    <xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME" />
  </xsl:variable>
  <xsl:variable name="tableName">
    <xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT" />
  </xsl:variable>
  <xsl:variable name="timeformat">
    <xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@TIMEFORMAT" />
  </xsl:variable>
</xsl:stylesheet>
<!--
========================================================================================
Copyright (c) 2008 - Gjermund Gusland Thorsen, released under the MIT License.
All rights deserved.
This piece comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
========================================================================================
-->
