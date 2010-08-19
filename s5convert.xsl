<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
   xmlns="http://www.w3.org/1999/xhtml" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" indent="yes"/>

  <xsl:variable name="docinfo" select="/document/docinfo[1]" />

  <!--  -->

  <xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
	<title><xsl:value-of select="/document/title" /></title>
	<!-- metadata -->
	<meta name="generator" content="S5" />
	<meta name="version" content="S5 1.3" />
	<meta name="presdate" content="[YYYYMMDD]" />
	<meta name="author" content="{$docinfo/author}" />
	<meta name="company" content="{$docinfo/organization}" />
	<!-- meta extensions -->
	<meta name="subject" content="{/document/title}" />
	<meta name="creator" content="[creator]" />
	<meta name="contributor" content="[contributor]" /><meta name="publisher" content="[publisher]" /><!-- meta temporary -->
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<!-- configuration parameters -->
	<meta name="defaultView" content="slideshow" />
	<meta name="controlVis" content="hidden" />
	<!-- configuration extensions -->
	<meta name="tranSitions" content="true" />
	<meta name="fadeDuration" content="500" />
	<meta name="incrDuration" content="250" />
	<!-- configuration autoplay extension -->
	<meta name="autoMatic" content="false" />
	<meta name="playLoop" content="false" />
	<meta name="playDelay" content="10" />
	<!-- configuration audio extension -->
	<meta name="audioSupport" content="false" />
	<meta name="audioVolume" content="100" />
	<meta name="audioError" content="false" />
	<!-- configuration audio debug -->
	<meta name="audioDebug" content="false" />
	<!-- style sheet links -->
	<link rel="stylesheet" href="ui/jyu_utf/slides.css" type="text/css" media="projection" id="slideProj" />
	<link rel="stylesheet" href="ui/jyu_utf/outline.css" type="text/css" media="screen" id="outlineStyle" />
	<link rel="stylesheet" href="ui/jyu_utf/print.css" type="text/css" media="print" id="slidePrint" />
	<link rel="stylesheet" href="ui/jyu_utf/opera.css" type="text/css" media="projection" id="operaFix" />
	<!-- embedded styles -->
	<style type="text/css" media="all">
	  /* embedded styles */
	</style>
	<!-- S5 JS -->
	<script src="ui/jyu_utf/slides.js" type="text/javascript"></script>
      </head>
      <body>

	<div class="layout">
	  <object type="image/svg+xml" id="soihtu" data="ui/jyu_utf/jyu-musta-optimized.svg">JYU</object>
	  <div id="controls"><!-- DO NOT EDIT --></div>
	  <div id="currentSlide"><!-- DO NOT EDIT --></div>
	  <div id="header"></div>
	</div>

	<div class="presentation">

	  <div class="slide">
	    <h1><xsl:value-of select="/document/title" /></h1>
	    <h2><xsl:value-of select="$docinfo/field[field_name = 'description']/field_body" /></h2>
	    <h3><xsl:value-of select="$docinfo/author" /></h3>
	    <h4><xsl:value-of select="$docinfo/organization" /></h4>
	  </div>

	  <xsl:apply-templates mode="slides" />

	</div>

      </body>
    </html>
  </xsl:template>

  <!-- Slide handling. Forgets "invalid" elements. -->

  <!--<xsl:template match="*|@*" mode="slides" priority="-10"/>-->

  <xsl:template match="/document/section" mode="slides" priority="10">
    <div class="slide">
      <h1><xsl:apply-templates select="title" mode="inline" /></h1>
      
      <xsl:apply-templates mode="body"/>
    </div>
  </xsl:template>


  <xsl:template match="bullet_list" mode="body">
    <ul>
      <xsl:for-each select="list_item">
	<li><xsl:apply-templates mode="body"/></li>
      </xsl:for-each>
    </ul>
  </xsl:template>

  <xsl:template match="paragraph" mode="body">
    <p><xsl:apply-templates mode="inline"/></p>
  </xsl:template>

  <xsl:template match="emphasis" mode="inline">
    <em><xsl:apply-templates mode="inline"/></em>
  </xsl:template>


  
</xsl:stylesheet>
