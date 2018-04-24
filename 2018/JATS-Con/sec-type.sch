<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:pattern>
        <sch:rule context="sec[@sec-type]" id="r1">
            <sch:let name="recommended" value="('introduction', 'COI-statement', 'data-availability-statement')"/>
            <sch:let name="recognized" value="($recommended, 'intro', 'conflict-of-interest', 'data-availabilty')"/>
            <sch:assert id="a1" role="warn" test="@sec-type = $recommended"
                >sec-type attribute value "<sch:value-of select="@sec-type"/>" is not in the recommended list of values for the sec-type attribute</sch:assert>
            <sch:assert id="a2" role="info" test="@sec-type = $recognized"
                >sec-type attribute value "<sch:value-of select="@sec-type"/>" is not a recognized value for the sec-type attribute.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>