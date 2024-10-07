## Navigating and Processing Data from the TEI with XSLT

Welcome to our workshop at TEI2024! Your hosts are an international team: 
* [Elisa Beshero-Bondar](https://github.com/ebeshero) (Professor of Digital Humanities @ Digital Media, Arts, and Technology program, Penn State Behrend, USA). 
* [Martina Scholger](https://github.com/martinascholger) (Senior Scientist @ Department of Digital Humanities, University of Graz, Austria). 
* [Gustavo Riva](https://github.com/GusRiva) (Senior Scientist @ University Library, Heidelberg University, Germany)

We are coordinating together to help test how well TEI and XSLT can connect the encoding and processing of documents across language and cultural differences.  

### Description and goals
Knowing how to navigate and explore data in your encoding can be an important way to learn how to work with TEI and XML generally. This workshop is designed for people who have some experience with markup languages and seek to learn more about how to work with digital scholarly editions as a basis for analysis and research. Markup in documents supplies structures and contexts that are particularly useful for processing data beyond what we can do with so-called "plain text". Our workshop will teach the pull-processing of data from XML/TEI with simple, reusable XSLT templates to represent in simple TSV/CSV and HTML tables/charts.

### Preparation
We will be working with the oXygen XML Editor in this workshop, which you should [install on your computer from here](https://www.oxygenxml.com/xml_editor/download_oxygenxml_editor.html) or update to the latest version if you already have it. If you are installing oXygen for the first time, note that oXygen comes with Author, Editor, and Developer versions. We will be using the Editor version in this workshop. oXygen comes with a free 30-day trial license key. 

### Accessing workshop files:

* Download this zipped directory to your computer and unzip to access the files:
<https://github.com/TEIC/tei2024-XSLT-workshop/archive/refs/heads/main.zip>

* If you know how to use GitHub, you should fork our repository at <https://github.com/ebeshero/dh2022-XSLT-workshop/>

### Outline
Please feel free to interrupt us vocally with questions! We also have a Google Doc that we can use for the workshop participants to share notes, paste in code, and ask questions: <https://docs.google.com/document/d/1Z2_P4Hwxaw_6SKEXnee5CQ5BRgNZIyEI1tF3QSZvkOg/edit?usp=sharing>

#### Part 1: Document Analysis: Review and refresh understanding of TEI XML tree structures
* Basic TEI structure
* working with XML and TEI projects in multiple languages 
  * German
  * English 
  * Japanese 
  * Spanish 


#### [Part 2: Orientation to XPath](xpath.md)
* working with project files to retrieve data with XPath in preparation for writing XSLT

#### [Part 3: Teach basic XSLT](xslt.md)
to produce simple outputs that curate data and show how these can be used in simple charts and graphs.
* Letter publication to HTML
* Letter to HTML Table
* Text 
* SVG 

#### Resources for continuing with XSLT
* Our Teaching Materials:
    * DHSI week-long course in XPath, XQuery, XSLT: <https://ebeshero.github.io/UpTransformation/schedule.html>
    * Programming Historian "Transforming Data for Reuse and Re-publication with XML and XSL": <https://programminghistorian.org/en/lessons/transforming-xml-with-xsl> (provides useful command line transformation and context outside of oXygen)
    * Elisa's XPath and XSLT tutorials: <https://newtfire.org/courses/tutorials/#xpath>
    * David Birnbaum's XPath and XSLT tutorials: <http://dh.obdurodon.org/index.xhtml#xpath>
* XML Slack
* Software besides oXygen that you can use to write XSLT 
    * With caution: Visual Studio Code with XPath/XSLT plugin: <https://marketplace.visualstudio.com/items?itemName=deltaxml.xslt-xpath>
 
