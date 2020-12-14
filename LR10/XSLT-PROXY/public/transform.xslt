<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>

            <head>
                <title> Response </title>
            </head>

            <body>
                <table>
                    <thead>
                        <tr>
                            <td> Decimal </td>
                            <td> Binary </td>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="objects/object">
                            <tr>
                                <td>
                                    <xsl:value-of select="dec"></xsl:value-of>
                                </td>
                                <td>
                                    <xsl:value-of select="bin"></xsl:value-of>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <p><a href="http://localhost:3001/">Назад</a></p>
            </body>

        </html>
    </xsl:template>
</xsl:stylesheet>

