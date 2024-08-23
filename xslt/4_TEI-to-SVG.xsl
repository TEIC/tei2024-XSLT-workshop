<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
   <!-- ebb: This will plot an SVG that reads the Spanish linguistics-markup letter file and outputs a value for each 
   part of speech and its percentage representation among all the words in the letter. 
   
   Input: xml/es_PS4000-TEIP5.xml
   
   Stored Output: output/letters-to-svg.svg
   
   -->
    
    <xsl:variable name="spanishLetter" as="document-node()" select="doc('../xml/es_PS4000-TEIP5.xml')"/>
    
    <xsl:variable name="wordCount" as="xs:integer" select="$spanishLetter//w => count()"/>
    
    <xsl:variable name="countTypes" as="xs:integer">
        <xsl:value-of select="$spanishLetter//w/@pos ! normalize-space() => distinct-values() => count()"/>
    </xsl:variable>
    
   <xsl:variable name="wordTypes" as="xs:string+" select="$spanishLetter//w/@pos ! normalize-space() => distinct-values()"/>
    
    <xsl:variable name="colors" as="xs:string+" select="'coral', 'pink', 'indianred'"/>
    
    <!--ebb: We'll plot percentages for each word type, so max Y value would be less than 100 -->
    <xsl:variable name="xSpacer" as="xs:integer" select="50"/>
    <xsl:variable name="ySpacer" as="xs:integer" select="-5"/>
    <!-- Y values go down the screen as they increase. So we relocate 0,0 down the screen and 
    plot backwards into negative space to make bars go *up*. This works best with literal calculations. 
    Just put a negative sign on an y-spacing variable to handle the drawing upwards. 
    -->
    
    <xsl:template match="/">
        <svg viewBox="0 0 600 500"> >
            
            <g transform="translate(50, 300)">
                <line id="x-Axis" x1="0" y1="0" x2="{$countTypes * $xSpacer}" y2="0" stroke="black" stroke-width="2"/> 
                <line id="y-Axis" x1="0" y1="0" x2="0" y2="{25 * $ySpacer}" stroke="black" stroke-width="2"/> 
                <text class="y-hash" x="-30" y="{25 * $ySpacer + 5}">25%</text>
                
                <text id="title" x="100" y="{25 * $ySpacer - 20}">Proportions of Word Types in the Spanish Letter</text>
                
            
        <xsl:comment><!--ebb: A comment "scratchpad" for surveying variable values. -->
            Wordcount: <xsl:value-of select="$wordCount"/> 
            Types of words: <xsl:value-of select="$countTypes"/>
            Word types: <xsl:value-of select="string-join($wordTypes, ', ')"/>
        </xsl:comment> 
                
                <g class="wordTypeData">
                    <!-- For each word type, return a percentage based on its count divided by the total word count * 100.-->
                    <xsl:for-each select="$wordTypes">
                        <xsl:sort select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
                        
                        <xsl:variable name="currentPos" as="xs:integer" select="position()"/>
                        <xsl:variable name="currentCount" as="xs:integer">
                            <xsl:value-of select="$spanishLetter//w[@pos ! normalize-space() = current()] => count()"/>
                        </xsl:variable>
                        
                        <xsl:variable name="percentage" as="xs:double">
                            <xsl:value-of select="$currentCount div $wordCount * 100"/>
                        </xsl:variable>
                        
                        <line x1="{position() * $xSpacer - $xSpacer div 2}" x2="{position() * $xSpacer - $xSpacer div 2}" y1="0" y2="{$percentage * $ySpacer}" stroke="{$colors[3 - $currentPos mod 3]}" stroke-width="{$xSpacer div 2}"/>
                        <!-- ebb: To set the colors in @stroke, look at the $colors variable: We stored three color values in sequence, and each one has a position value of 1, 2, and 3.
                             So, we can do a little XPath arithmetic to determine which of the three color values is applied: 
                             We are processing each member of the sequence of $wordTypes, and we have three colors.
                             We can divide the position value by 3 and output the remainder of the division, known as the modulo. This is found with the XPath mod operator. 
                             But when a number is divisible by 3, we will have '0' as result, and that is not a position on our color list.
                             So, we subtract 3 - current position in the sequence of $wordTypes: 
                             3 - 1 mod 3 = 3 - 2 = 1  (coral)
                             3 - 2 mod 3 = 3 - 1 = 2  (pink)
                             3 - 3 mod 3 = 3 - 0 = 3  (indianred)
                             ...
                             3 - 6 mod 3 = 3 - 0 = 3 (indianred)
                             3 - 7 mod 3 = 3 - 1 = 2 (pink)
                             (etc.)
                             So we work with the remainders of a division by 3, and ensure that values are always 1, 2, or 3.   
                        -->
                        
                        <text class="wordType" x="{position() * $xSpacer - $xSpacer div 2}" y="20"><xsl:value-of select="current()"/></text>
                        
                        <text class="percentLabel" x="{position() * $xSpacer - $xSpacer div 1.5}" y="{$percentage * $ySpacer -15}"><xsl:value-of select="$percentage ! round(., 2)"/>%</text>
                        
                    </xsl:for-each>
                </g>
            </g>
        </svg>
      </xsl:template>
   
</xsl:stylesheet>