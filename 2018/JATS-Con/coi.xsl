<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="node() | @*" priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="(@fn-type | @sec-type)[. = ('coi-statement', 'conflict', 'conflict-of-interest', 'coi')]">
        <xsl:attribute name="{local-name()}">COI-statement</xsl:attribute>
    </xsl:template>

</xsl:stylesheet>