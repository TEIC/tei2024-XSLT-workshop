# What is XPath
XPath is a syntax used in XSLT, XQuery, and other X-technologies to navigate through XML documents and generate "returns." For example, it can be used to extract subtrees, manipulate data, or count elements.

# Node Types
- Document node (addressed with `/` to read the document)
- Root node (`TEI`)
- Element nodes (`opener`, `closer`, `persName`)
- Attribute nodes (`@ref`, `@type`)
- Text nodes (`text()`)

# XPath Navigation
- A localization step consists of an axis specification, the node test, and possibly a predicate: `//rs[@type='person']`

![XPath Axes](xpath-axis.gif)


# XPath navigation
- Navigate `child::` and `descendant::` axes
- Try the `preceding` and `preceding-sibling` axes. (There are "following" equivalents to both of these.) 
- Apply predicates as boolean filters, using `[. . .]`
- Look at XPath functions: 
    - `normalize-space()`
    - `count()`
    - `distinct-values()`
    - Different styles of writing these expressions: nesting (XPath 2) vs. **simple-map**: `!` and arrow operator: `=>` (XPath 3)
        - `//*/normalize-space()` (XPath 2) vs. `//* ! normalize-space()` (XPath 3) mean the same thing.
        - `text()` node vs. `//string()` and a "deep" discussion of what `normalize-space()`
        - Basic math and arithmetic operations


# Workshop XPath expressions 

- What XPath would find the paragraphs in the file?
- What XPath would find only the paragraphs inside the body?
- What XPath identifies only the \<persName\> element inside the \<closer\>?   
- What XPath would find the name of the sender?

## For letters with names encoded
- What XPath will find all the person names encoded in the letter? 
- How many of these are there?
- What XPath will find the values of the @ref attribute in the \<persName> elements?
- Which function will find the distinct attribute values? 

## For letters with parts of speech encoded (The following questions only apply to the **es_P54000-TEIP5.xml** document):
Write XPath expressions to isolate different parts of speech, working carefully with predicate expressions. 
- What XPath will find all the nouns (pos='N')?
- How many of these are there? 
- What XPath will find all the nouns which are directly preceded by a determiner (pos='D')?

## Links

* [XPath Cheatsheet](https://devhints.io/xpath)
* [XPath and XQuery Functions and Operators 3.1](https://www.w3.org/TR/xpath-functions-31/)
* Wikipedia article ["XPath"](https://es.wikipedia.org/wiki/XPath)