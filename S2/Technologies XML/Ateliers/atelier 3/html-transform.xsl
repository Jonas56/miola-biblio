<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>My first XSLT</title>
            </head>
            <body>
                <h2>Personnes Liste</h2>
                <table border="1">
                    <tr>
                        <th>nom</th>
                        <th>prenom</th>
                        <th>matricule</th>
                        <th>date de naissance</th>
                    </tr>
                    <xsl:for-each select="annuaire/personne">
                        <xsl:sort select="prenom"/>
                         <xsl:if test="sexe = 'F'"> 
                            <tr>
                                <td>
                                    <xsl:value-of select="nom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="prenom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@matricule"/>
                                </td>
                                <td>
                                    <xsl:value-of select="DateNaissance"/>
                                </td>
                            </tr>
                         </xsl:if> 
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

