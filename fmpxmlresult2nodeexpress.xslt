<?xml version="1.0" encoding="utf-8"?>
<!--
  Written by Gjermund G Thorsen 2017, all rights deserved
  for the purpose of generating JSON route node from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no" />
<xsl:template match="fmp:FMPXMLRESULT">
<xsl:text>const
  express = require( 'express' ),
  router  = express.Router();

router.post( '/</xsl:text><xsl:value-of select="$tableName" />
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>/:</xsl:text>
  <xsl:value-of select="@NAME"/>
</xsl:for-each>
<xsl:text>', function( req, res ) {
</xsl:text>
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>  res.send( req.params.</xsl:text>
  <xsl:value-of select="@NAME"/>
  <xsl:text> );
</xsl:text>
</xsl:for-each>
<xsl:text>});

router.get( '/</xsl:text><xsl:value-of select="$tableName" />
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>/:</xsl:text>
  <xsl:value-of select="@NAME"/>
</xsl:for-each>
<xsl:text>', function( req, res ) {
</xsl:text>
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>  res.send( req.params.</xsl:text>
  <xsl:value-of select="@NAME"/>
  <xsl:text> );
</xsl:text>
</xsl:for-each>
<xsl:text>});

router.put( '/</xsl:text><xsl:value-of select="$tableName" />
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>/:</xsl:text>
  <xsl:value-of select="@NAME"/>
</xsl:for-each>
<xsl:text>', function( req, res ) {
</xsl:text>
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>  res.send( req.params.</xsl:text>
  <xsl:value-of select="@NAME"/>
  <xsl:text> );
</xsl:text>
</xsl:for-each>
<xsl:text>});

router.delete( '/</xsl:text><xsl:value-of select="$tableName" />
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>/:</xsl:text>
  <xsl:value-of select="@NAME"/>
</xsl:for-each>
<xsl:text>', function( req, res ) {
</xsl:text>
<xsl:for-each select="fmp:METADATA/fmp:FIELD">
  <xsl:text>  res.send( req.params.</xsl:text>
  <xsl:value-of select="@NAME"/>
  <xsl:text> );
</xsl:text>
</xsl:for-each>
<xsl:text>});

</xsl:text>
  </xsl:template>
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
