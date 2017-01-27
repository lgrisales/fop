<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="no"
		indent="yes" />
	<!-- ========================= -->
	<!-- root element: projectteam -->
	<!-- ========================= -->
	<xsl:template match="report">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

			<fo:layout-master-set>
				<fo:simple-page-master master-name="letter-portrail"
					page-height="297mm" page-width="210mm" margin-top="5mm"
					margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
					<fo:region-body margin-top="25mm" margin-bottom="20mm" />
					<fo:region-before region-name="xsl-region-before"
						extent="25mm" display-align="before" precedence="true" />
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- fo:layout-master-set> <fo:simple-page-master master-name="simpleA4" 
				page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" 
				margin-left="2cm" margin-right="2cm"> <fo:region-body/> </fo:simple-page-master> 
				</fo:layout-master-set -->
			<fo:page-sequence master-reference="letter-portrail">


				<fo:static-content flow-name="xsl-region-before">
					<fo:table table-layout="fixed" width="100%" font-size="10pt"
						border-color="black" border-width="0.4mm" border-style="solid">
						<fo:table-column column-width="proportional-column-width(20)" />
						<fo:table-column column-width="proportional-column-width(45)" />
						<fo:table-column column-width="proportional-column-width(20)" />
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell text-align="left" display-align="center"
									padding-left="2mm">
									<fo:block>
										Bill Id:
										
										, Date:
										<xsl:value-of select="date" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" display-align="center">
									<fo:block font-size="150%">
										<fo:basic-link external-destination="http://www.example.com"><xsl:value-of select="title" /></fo:basic-link>
									</fo:block>
									<fo:block space-before="3mm" />
								</fo:table-cell>
								<fo:table-cell text-align="right" display-align="center"
									padding-right="2mm">
									<fo:block>
										<xsl:value-of select="title" />
									</fo:block>
									<fo:block display-align="before" space-before="6mm">
										Page
										<fo:page-number />
										of
										<fo:page-number-citation ref-id="end-of-document" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					
					<fo:block font-size="10pt">

						<fo:table table-layout="fixed" width="100%" font-size="10pt"
							border-width="0.4mm" >

							<fo:table-column column-width="4cm" />
							<fo:table-column column-width="4cm" />
							<fo:table-column column-width="5cm" />
							<fo:table-column column-width="5cm" />
							<fo:table-body>
								
								<fo:table-row height="8mm" >
								<xsl:attribute name="font-weight">bold</xsl:attribute>
                                <fo:table-cell >
                                    <fo:block>Full Name</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>Function</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block>Email</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" >
                                    <fo:block>Salary</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            
								<xsl:apply-templates select="rows/row">
								</xsl:apply-templates>
							</fo:table-body>
						</fo:table>
					</fo:block>
					
					<fo:block font-weight="bold" >					
					
                  		TOTAL: <xsl:value-of select="format-number(total,'###,###.00')" />
                    </fo:block>
                    
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<!-- ========================= -->
	<!-- child element: member -->
	<!-- ========================= -->
	<xsl:template match="rows/row">
		<fo:table-row>
			<!-- xsl:if test="function = 'lead'"> <xsl:attribute name="font-weight">bold</xsl:attribute> 
				</xsl:if -->
			<fo:table-cell>
				<fo:block>
					<xsl:value-of select="name" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block>
					<xsl:value-of select="function" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block>
					<xsl:value-of select="email" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell text-align="right">
				<fo:block>
					$ <xsl:value-of select="format-number(salary,'###,###.00')" />
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
</xsl:stylesheet>
