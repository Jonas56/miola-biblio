<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"  version="3.0">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="/" >
	<xsl:element name="ann">
	
	<xsl:for-each select="annuaire/personne[sexe='F']">
	<xsl:sort select="prenom"/>
	
	<xsl:element name="Person">
	   <xsl:attribute name="Id">
	   <xsl:value-of select="@matricule"/>
	   </xsl:attribute>
	   <xsl:element name="Name">
	   <xsl:value-of select="nom"/>
	   </xsl:element>
	   <xsl:element name="Birthday">
	   <xsl:value-of select="DateNaissance" />
	   </xsl:element>
	</xsl:element>
	</xsl:for-each>
	</xsl:element>
	</xsl:template>
</xsl:stylesheet>
