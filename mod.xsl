<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.pay-choose">
        <!-- className 'J_OXMod' required  -->
        <xsl:param name="payurl">{paymethod}</xsl:param>
        <div class="J_OXMod oxmod-pay-choose" ox-mod="pay-choose" data-payurl="{$payurl}">
            <form action="{$payurl}">
                <input type="hidden" name="_id" value="{q/_id}"/>
                <input type="hidden" name="oid" value="{q/oid}"/>
                <xsl:variable name="isWeixin" select="env/client = 'weixin'"/>
                <ul class="payment">
                    <xsl:for-each select="data/options/i">
                        <xsl:if test="not($isWeixin and value = 'weixinh5') and not(not($isWeixin) and value = 'weixin')">
                            <li class="paymethod_{value}">
                                <label class="pay-{value}">
                                    <input type="radio" name="paymethod" value="{value}">
                                        <xsl:if test="position() = 1">
                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                        </xsl:if>
                                    </input>
                                    <xsl:value-of select="text"/>
                                </label>
                            </li>
                        </xsl:if>

                    </xsl:for-each>
                </ul>
                <xsl:choose>
                    <xsl:when test="count(data/options/i) = 0 ">
                        <h3 class="error">商家未配置任何支付方式</h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <div class="op">
                            <button class="bt-submit">确认支付</button>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>


            </form>
        </div>
    </xsl:template>
</xsl:stylesheet>
