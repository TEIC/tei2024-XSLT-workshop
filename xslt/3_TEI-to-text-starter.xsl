<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="text" indent="yes"/>
    
    <!-- Global variables -->
    
    <xsl:variable name="spanishLetter" as="document-node()" select="doc('../xml/es_PS4000-TEIP5.xml')"/>
    
    <xsl:variable name="wordCount" as="xs:integer" select="//w => count()"/>
    
    <xsl:variable name="countTypes" as="xs:integer">
        <xsl:value-of select="//w/@pos ! normalize-space() => distinct-values() => count()"/>
    </xsl:variable>
    
    <xsl:variable name="wordTypes" as="xs:string+" select="//w/@pos ! normalize-space() => distinct-values()"/>
    
    
    
    <xsl:template match="/">
        
        
        <xsl:text>wordType</xsl:text><xsl:text>,</xsl:text><xsl:text>percentLabel</xsl:text>
        <xsl:text>&#x000D;</xsl:text>
        
        
        <!-- For each word type, return a percentage based on its count divided by the total word count * 100.-->
             
                wordType,percentLabel
                Z,0.97
                A,2.14
                R,7.96
                D,9.51
                P,10.1
                C,12.82
                S,15.53
                N,17.86
                V,20.19
        
    </xsl:template>
    
</xsl:stylesheet>