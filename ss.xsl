<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet id="lab-situation-1" version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns="http://www.prime-xs.eu/ms/qcml" xmlns="">
    <xsl:template match="/">
        <html>
            <style><!-- css settings for div elements -->
                H1 {
                    font-family:Arial; font-size:20pt
                }
                div.rahmen {  
                    background: #FFFAF0;  
                    border: 1px solid;  
                    padding: 5px;
                    margin: 40px;  
                }
                div.thickline {  
                    border-width: 2px;  
                    border-style: solid;  
                }  
            </style>
            <body>
                <div align="center">
                    <h1>Outlier Detection and Interpretation</h1>
                    <!-- overview -->
                    <p style="border-color:#000000; border-width:2px; border-style:solid; padding:4px">
                        <h2>Combined Analysis</h2>
                        <xsl:for-each select="ns:qcML/ns:setQuality">
                            <table>
                                <center>
                                    <tr><td colspan="3"><h3>Visualization</h3></td></tr>
                                    <tr>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@ID='time']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b><xsl:value-of select="ns:attachment[@ID='time']/@name"/></b></figcaption>
                                            </figure>
                                        </td>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@ID='PCA']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b><xsl:value-of select="ns:attachment[@ID='PCA']/@name"/></b></figcaption>
                                            </figure>
                                        </td>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@ID='t-SNE']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b><xsl:value-of select="ns:attachment[@ID='t-SNE']/@name"/></b></figcaption>
                                            </figure>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><h3>QC metrics</h3></td>
                                        <td><h3>Outlier score histogram</h3></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@ID='corr']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b><xsl:value-of select="ns:attachment[@ID='corr']/@name"/></b></figcaption>
                                            </figure>
                                        </td>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@ID='OutlierScoreHistogram']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b><xsl:value-of select="ns:qualityParameter[@ID='OutlierScoreThreshold']/@name"/> = <xsl:value-of select="format-number(ns:qualityParameter[@ID='OutlierScoreThreshold']/@value, '00.00%')"/></b></figcaption>
                                            </figure>
                                        </td>
                                    </tr>
                                </center>
                            </table>
                        </xsl:for-each>
                    </p>
                    <p style="border-color:#000000; border-width:2px; border-style:solid; padding:4px">
                        <h2>Individual Outliers</h2>
                        <xsl:for-each select="ns:qcML/ns:runQuality">
                            <h3><xsl:value-of select="@ID"/></h3>
                            <p><b>Outlier score = <xsl:value-of select="format-number(ns:qualityParameter[@name='Outlier score']/@value, '00.00%')"/></b></p>
                            <table>
                                <center>
                                    <tr>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@name='Feature importance']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b>Feature importance</b></figcaption>
                                            </figure>
                                        </td>
                                        <td>
                                            <figure style="width:500px;">
                                                <img style="max-height:100%; max-width:100%"><xsl:attribute name="src">data:image/svg+xml;base64,
                                                    <xsl:value-of select="ns:attachment[@name='Outlier subspace']/ns:binary"/></xsl:attribute>
                                                </img>
                                                <figcaption><b>Explanatory subspace</b></figcaption>
                                            </figure>
                                        </td>
                                    </tr>
                                </center>
                            </table>
                            <xsl:choose>
                                <xsl:when test="position() != last()"><hr/></xsl:when>
                            </xsl:choose>
                        </xsl:for-each>
                    </p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>