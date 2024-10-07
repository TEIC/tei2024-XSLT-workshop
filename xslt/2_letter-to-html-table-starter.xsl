<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- This XSLT is a starting point to output an HTML table with correspondence metadata from all letters
    
    Stored Output: output/letter-to-table.html
    -->
    
    <xsl:output method="xhtml" html-version="5" indent="yes"></xsl:output>
    
    <xsl:variable name="letters" select="collection('../xml/?select=*.xml')"/>
    
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
                <table border="1">
                    <thead>
                        <tr>
                            <th>Sender</th>
                            <th>Receiver</th>
                            <th>Place</th>
                            <th>Date</th>
                        </tr>
                    </thead>

                    <!-- 
                    <tbody>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                         </tr>
                         <tr>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                            <td>...</td>
                         </tr>
                     </tbody>
                     -->
 
                </table>
            </body>
        </html>
    </xsl:template>
    
 
    
</xsl:stylesheet>