<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Person List</title>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <h1>Person List</h1>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>City</th>
                        <th>Occupation</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Hobby</th>
                    </tr>
                    <xsl:for-each select="data/person">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="age"/></td>
                            <td><xsl:value-of select="gender"/></td>
                            <td><xsl:value-of select="city"/></td>
                            <td><xsl:value-of select="occupation"/></td>
                            <td><xsl:value-of select="email"/></td>
                            <td><xsl:value-of select="phone"/></td>
                            <td><xsl:value-of select="hobby"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
