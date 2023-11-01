@AbapCatalog.sqlViewName: 'ZEAKBULUT_5048V3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Ödevi 2-2'
define view ZEAKBULUT_5048_CDS_003 as select from zeakbulut_5048v2 as cdsv3
{
    cdsv3.vbeln,
    sum(cdsv3.conversion_netwr)                                   as Toplam_Net_Deger,
    cdsv3.kunnrad,
    count(*)                                                      as Toplam_Fatura_Adedi,
    division(cast( sum(conversion_netwr) as abap.curr( 10, 3 ) ), 
             cast( count(*) as abap.int1 ), 3)                    as Ortalama_Miktar,
    left(fkdat,4)                                                 as Faturalama_Yili,
    substring(fkdat,5,2)                                          as Faturalama_Ayi,
    substring(fkdat,7,2)                                          as Faturalama_Gunu,
    substring(inco2_l,1,3)                                        as Incoterm_Yeri,
    fkdat
}
group by cdsv3.vbeln,
         cdsv3.kunnrad,
         cdsv3.fkdat,
         cdsv3.inco2_l
