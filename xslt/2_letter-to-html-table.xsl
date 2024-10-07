<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- This XSLT contains the solution for creating an HTML table with correspondence metadata from all letters, adding a javascript for dynamic datatables
    
    Stored Output: output/letter-to-table.html
    -->
    
    
    <xsl:output method="xhtml" html-version="5" indent="yes"></xsl:output>
    
    <xsl:variable name="letters" as="document-node()+" select="collection('../xml/?select=*.xml')"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Correspondence Metadata Table for All the Letters</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                
                <!-- MS: add Javascript and CSS references for dynamic datatables -->
                <link rel="stylesheet" href="https://cdn.datatables.net/2.1.4/css/dataTables.dataTables.css" />
                <script src="js/jquery-3.7.1.js"></script>
                <script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script>
                <script src="js/ready.js"></script>
            </head>
            <body>
                <h1>Correspondence Metadata</h1>
                <table border="1" id="myTable" class="display">
                    <thead>
                        <tr>
                            <th>Sender</th>
                            <th>Receiver</th>
                            <th>Place</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="$letters//correspDesc"/>
                    </tbody>
                    <!-- ebb: This way works as well! It's another alternative. 
                 Pull-processing relies on the use of the @select attribute to "prune" the source XML tree and process
                 only what we wish to pull from it. 
                 
                 <xsl:for-each select="$letters//correspDesc">
                        <tr>
                            <td>
                                <xsl:value-of select="correspAction[@type='received']/persName" />
                            </td>
                            <td>
                                <xsl:value-of select="correspAction[@type='sent']/persName" />
                            </td>
                            <td>
                                <xsl:value-of select="correspAction[@type='sent']//placeName" />
                            </td>
                            <td>
                                <xsl:value-of select="correspAction[@type='sent']/date/@when" />
                            </td>
                        </tr>
                    </xsl:for-each>-->
                </table>
            </body>
        </html>
    </xsl:template>
    
   <xsl:template match="correspDesc">
        <tr>
            <td>
                <xsl:value-of select="correspAction[@type='received']/persName" />
            </td>
            <td>
                <xsl:value-of select="correspAction[@type='sent']/persName" />
            </td>
            <td>
                <xsl:value-of select="correspAction[@type='sent']//placeName" />
            </td>
            <td>
                <xsl:value-of select="correspAction[@type='sent']/date/@when" />
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>