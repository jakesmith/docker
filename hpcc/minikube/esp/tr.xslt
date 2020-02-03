<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="Environment/Software/DafilesrvProcess/Instance">
    <xsl:copy>
     <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
    <xsl:copy>
     <xsl:apply-templates select="@*[name()!='name' and name()!='computer' and name()!='netAddress']"/>
     <xsl:attribute name="name">s2</xsl:attribute>
     <xsl:attribute name="computer">HOST</xsl:attribute>
     <xsl:attribute name="netAddress">HOST</xsl:attribute>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
