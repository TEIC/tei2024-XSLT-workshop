<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
<!-- 2024-08-23 ebb: This XSLT is designed to read one TEI XML file and output one HTML "reading view". 
   Notice how the xpath-default-namespace and the xmlns attributes are defined in the XSLT root element! 
   This is very important because they define the namespace of the input and the output files.
   
    Run this on the es letter, and then one of the other letters (like 1819-01-10-MaryWebb.xml) to compare output.
    -->
    
        <xsl:output method="xhtml" html-version="5" indent="yes"/>
  
    
    <xsl:template match="/">
           <html>
            <head>
                <title><xsl:apply-templates select=".//titleStmt/title" /></title>
              
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            </head>
            <body>

              <!--Here we begin to "push process" the letter contents: -->  
                <section id="letter">
                    <xsl:apply-templates select=".//text/body"/>
                </section>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="div">
        <div>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    
    <xsl:template match="p | opener | closer">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

 <!-- ebb: In the following two templates, we apply some CSS color highlighting to proper names, or to nouns with determiners (in the Spanish letter) using the HTML <em> element and  @style attribute  -->   
    <xsl:template match="w[@pos='N']">
        <!-- Try making this template match on more elements in other letter files with:
        *[@ref] | *[@corresp] | w[@pos='N']
        -->
        <em style="color:red;">
            <xsl:apply-templates />
        </em>
    </xsl:template>
    
    <xsl:template match="w[@pos='D'][following-sibling::w[1][@pos='N']]">
        <em style="color:blue;"><xsl:apply-templates/></em>
    </xsl:template>
    
    
    <xsl:template match="figure"/>
   
    <!--ebb: This template above is suppressing elements from being output! Try commenting it 
    out and inspect the results. Are there other elements from the input that we may want to
    suppress in the output?
    
    -->
    
    <xsl:template match="choice">
       <xsl:apply-templates select="orig | abbr"/>
    </xsl:template>
    <!-- This template above is processsing the <choice> elements in the input and 
    it is processing on the contents of the <orig> and <abbr> children. 
    Look at the input TEI file (for the Spanish letter) and see what it is skipping. 
    (Do we see the contents of <reg> or  <expan> in the output?)
    -->
    
    
   <xsl:template match="TEI[@xml:lang='ja']//text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    <!-- kn ebb ms: This template is necessary for proper space-handling of Japanese text output. 
    For elaboration, process the Japanese letter file with and without this template, look at the 
    output view as code, and search for spaces. Japanese literation should not include spacing between words.
    It does not, however, work in a desirable way for the processing of the Spanish letter. Try modifying the template
    match to see what it does in processing different letters:
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
    -->
    
</xsl:stylesheet>