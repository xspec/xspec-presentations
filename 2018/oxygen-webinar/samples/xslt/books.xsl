<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs f xd"
    xmlns:f="http://oxygenxml.com/xslt/functions"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    version="2.0">
    
    <xd:doc>
        <xd:desc>Coputes the total proce for a set of books by looking at the price element.</xd:desc>
        <xd:param name="books">Books to compute the price.</xd:param>
        
        <xd:return></xd:return>
    </xd:doc>
    <xsl:function name="f:totalPrice">
        <xsl:param name="books"/>
        
        <xsl:value-of select="sum($books/price/text())"/>
    </xsl:function>

    <xd:doc>
        <xd:desc>Outputs some details about the book.</xd:desc>
        <xd:param name="book"/>
    </xd:doc>
    <xsl:template name="printBookTitle">
        <xsl:param name="book"/>
        
        <div class="book.title">
            <h2><xsl:value-of select="$book/title"/></h2>
            <div>
                <span><xsl:value-of select="f:formatDate($book/date/text())"/></span>
                <span>by <xsl:value-of select="book/author"/></span>
            </div>
        </div>
    </xsl:template>
    
    <xsl:function name="f:formatDate">
        <xsl:param name="date"/>
        
        <xsl:value-of select="format-date($date,'[M]/[D]/[Y]')"/>
    </xsl:function>
    
    
    <xd:doc>
        <xd:desc>Generates an outline for the books.</xd:desc>
    </xd:doc>
    <xsl:template match="books" mode="outline">
        <ol>
            <xsl:apply-templates mode="outline"/>
        </ol>
    </xsl:template>
    
    <xsl:template match="book" mode="outline">
        <li><xsl:value-of select="title"/></li>
    </xsl:template>

</xsl:stylesheet>