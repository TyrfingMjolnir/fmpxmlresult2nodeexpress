<?xml version="1.0" encoding="utf-8"?>
<!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating separate file for each NodeJS express route node from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" />
<xsl:template match="fmp:FMPXMLRESULT">
<xsl:text>// To be called from app.js like this: app.use( `/</xsl:text><xsl:value-of select="$tableName" /><xsl:text>`, require( `./</xsl:text><xsl:value-of select="$tableName" /><xsl:text>` ) );
// or : app.use( `/</xsl:text><xsl:value-of select="$schemaTableName" /><xsl:text>`, require( `./</xsl:text><xsl:value-of select="$schemaTableName" /><xsl:text>` ) );
// or : app.use( `/</xsl:text><xsl:value-of select="$databaseName" /><xsl:text>`, require( `./</xsl:text><xsl:value-of select="$databaseName" /><xsl:text>` ) );

const
  express    = require( `express` ),
  routernode = express.Router();

routernode.route( `/` )
  // Create resource
  .post( ( req, res ) => {
    res.status( 200 ).send( `Add a book using body` );
  } )
  // Read resource at random
  .get( ( req, res ) => {
    res.status( 200 ).send( `Get a resource at random` );
  } );

// below is a redonkulous long list of field names; namely all of them for the table in question, please reduce to only include the one you actually need.
// routernode.route( `/:id` )
routernode.route( `</xsl:text><xsl:apply-templates select="fmp:METADATA/fmp:FIELD"/><xsl:text>` )
	
  // Read resource
  .get( ( req, res ) => {
    res.status( 200 ).send( `Get the resource ${req.params.id}` );
  } )
  // Update resource
  .patch( ( req, res ) => {
    res.status( 200 ).send( `Update the resource ${req.params.id} using body for updates` );
  } )
  // Update replacing resource
  .put( ( req, res ) => {
    res.status( 200 ).send( `Replace the resource ${req.params.id} use body for replacement` );
  } )
  // Delete resource
  // Typically implemented as an update mark for deletion.
  .delete( ( req, res ) => {
    res.status( 200 ).send( `Delete the resource ${req.params.id}` );
  } );

module.exports = routernode;
</xsl:text>
	</xsl:template>
	<xsl:template match="fmp:METADATA/fmp:FIELD"><xsl:text>/:</xsl:text><xsl:value-of select="@NAME"/></xsl:template>
  <xsl:variable name="schemaTableName">
	<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME" />
	<xsl:text>.</xsl:text>
    <xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT" />
  </xsl:variable>
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
