<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="Environment/Hardware/Computer">
    <xsl:copy>
     <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    <xsl:copy>
     <xsl:apply-templates select="@*[name()!='name' and name()!='netAddress']"/>
     <xsl:attribute name="name">DALIHOST</xsl:attribute>
     <xsl:attribute name="netAddress">DALIHOST</xsl:attribute>
    </xsl:copy>
</xsl:template>

<xsl:template match="Environment/Software/DafilesrvProcess/Instance">
    <xsl:copy>
     <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    <xsl:copy>
     <xsl:apply-templates select="@*[name()!='name' and name()!='computer' and name()!='netAddress']"/>
     <xsl:attribute name="name">s2</xsl:attribute>
     <xsl:attribute name="computer">DALIHOST</xsl:attribute>
     <xsl:attribute name="netAddress">DALIHOST</xsl:attribute>
    </xsl:copy>
</xsl:template>

<xsl:template match="Environment/Software/DaliServerProcess/Instance">
    <xsl:copy>
     <xsl:apply-templates select="@*[name()!='computer' and name()!='netAddress']"/>
     <xsl:attribute name="netAddress">DALIHOST</xsl:attribute>
     <xsl:attribute name="computer">DALIHOST</xsl:attribute>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
