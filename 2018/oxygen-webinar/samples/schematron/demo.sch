<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    
    <sch:pattern>
        <sch:rule context="book">
            <sch:assert test="title" id="book-without-title">
                Books should have a title.
            </sch:assert>
        </sch:rule>
        
        
        <sch:rule context="shortdesc">
            <sch:let name="words" value="count(tokenize(normalize-space(.), ' '))"/>
            
            <sch:assert test="$words = 12" role="warn" id="shortdesc-too-long">
                Too many words inside. 
                You have 
                <sch:value-of select="$words"/>
                <sch:value-of select="if ($words=1) then ' word' else ' words'"/>. 
            </sch:assert>
            
            <sch:assert test="$words &gt;= 5" role="warn" id="shortdesc-too-short">
                Too few words inside.
                You have <sch:value-of select="$words"/>
                <sch:value-of select="if ($words=1) then ' word' else ' words'"/>.
            </sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>