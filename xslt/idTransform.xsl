<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"    
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">

<!-- 2024-08-23 ebb: This is an identity transformation stylesheet.
    Where there is no template rule to match, the default behavior 
    is set to output a shallow copy of each node, that is the node 
    and its children. The only template rules we write are 
    for what we wish to change.
    
    Input: We have designed this XSLT to process the Spanish TEI letter: 
    es_PS4000-TEIP5.xml and alter its tagging.
    
    In the first template rule, we are matching <persName> elements and replacing their tags with 
    <name type="person">. The contents of the element remain exactly the same in the output. (Look for the changes
    in the TEI header. 
    
    In the second template rule, we are removing the <w> element tags and processing only their
    contents. This is a convenient way to remove tags from your file without losing their content.
    
    Output is stored at output/id-transform-esLetter.xml
    -->
    
 <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="persName">
        <name type="person"><xsl:apply-templates/></name>   
    </xsl:template>
    
    <xsl:template match="w">  
        <xsl:apply-templates/>
    </xsl:template>
    
</xsl:stylesheet>