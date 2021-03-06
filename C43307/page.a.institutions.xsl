<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" />
  
  <xsl:include href="common.xsl" />
  
  <xsl:template match="/">
    <out>
      <xsl:call-template name="menuAdmin" />
      
      <h1><xsl:value-of select="/data/lang/a_t_banques" /></h1>
      <table>
        <thead>
          <tr>
            <th><xsl:value-of select="/data/lang/a_c_id" /></th>
            <th><xsl:value-of select="/data/lang/a_c_nom" /></th>
            <th><xsl:value-of select="/data/lang/a_c_logo" /></th>
            <th><xsl:value-of select="/data/lang/a_c_lien" /></th>
            <th> </th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="/data/item">
            <tr>
              <td><xsl:value-of select="id" /></td>
              <td>
                <form method="POST" action="a.institutions.edit">
                  <input type="hidden" name="id" value="{id}"/>
                  <input type="text" name="n" value="{name}" onblur="request(this)" />
                </form>
              </td>
              <td>
                <form method="POST" action="a.institutions.edit">
                  <input type="hidden" name="id" value="{id}"/>
                  <select name="logo" onblur="request(this)">
                    <xsl:variable name="logo" select="logo"/>
                    <xsl:for-each select="/data/images/item">
                      <option>
                        <xsl:if test=". = $logo">
                          <xsl:attribute name="selected">true</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="." />
                      </option>
                    </xsl:for-each>
                  </select><br/>
                  <br/>
                  <img src="{logo}" alt=""/>
                </form>
              </td>
              <td>
                <form method="POST" action="a.institutions.edit">
                  <input type="hidden" name="id" value="{id}"/>
                  <textarea cols="50" rows="5" name="link" onblur="request(this)"><xsl:value-of select="link" /></textarea>
                </form>
              </td>
              <th>
                <form method="POST" action="a.institutions.delete">
                  <input type="hidden" value="{id}" name="id"/>
                  <div class="delete" onclick="if(confirm('Etes-vous certain de vouloir supprimer cette entr&#233;e?')) request(this)">&#160;</div>
                </form>
              </th>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
      
      <h1><xsl:value-of select="/data/lang/a_t_ajouter" /></h1>
      <form method="POST" action="a.institutions.add">
        <table>
          <tr>
            <th><xsl:value-of select="/data/lang/a_c_id" /></th>
            <td>#</td>
          </tr>
          <tr>
            <th><xsl:value-of select="/data/lang/a_c_nom" /></th>
            <td><input type="text" name="n" /></td>
          </tr>
          <tr>
            <th><xsl:value-of select="/data/lang/a_c_logo" /></th>
            <td>
              <select name="logo">
                <option value=""><xsl:value-of select="/data/lang/a_c_aucune" /></option>
                <xsl:for-each select="/data/images/item">
                  <option><xsl:value-of select="." /></option>
                </xsl:for-each>
              </select>
            </td>
          </tr>
          <tr>
            <th><xsl:value-of select="/data/lang/a_c_lien" /></th>
            <td>
              <textarea cols="50" rows="5" name="link"><xsl:value-of select="link" /></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2" class="center"><div class="add" onclick="request(this)">&#160;</div></td>
          </tr>
        </table>
      </form>
      <script>
        $('.add').button({
          icons: { primary: "ui-icon-circle-plus"},
          text: false
        })
        $('.delete').button({
          icons: { primary: "ui-icon-circle-close"},
          text: false
        })
        $(function() {
          $('input').keypress(function(event) {
            if (event.which == 13) {
                event.preventDefault();
            }
          });
        });
      </script>
    </out>
  </xsl:template>
</xsl:stylesheet>