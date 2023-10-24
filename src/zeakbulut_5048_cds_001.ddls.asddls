@AbapCatalog.sqlViewName: 'ZEAKBULUT_5048V1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Emirhan Akbulut CDS 001'
define view ZEAKBULUT_5048_CDS_001 as select from ekko
inner join ekpo      on ekpo.ebeln = ekko.ebeln
inner join mara      on mara.matnr = ekpo.matnr
inner join lfa1      on lfa1.lifnr = ekko.lifnr
left outer join makt on makt.matnr  = mara.matnr 
                    and makt.spras = $session.system_language
{ ekpo.ebeln,
  ekpo.ebelp,
  ekpo.matnr,
  makt.maktx,
  ekpo.werks,
  ekpo.lgort,
  ekpo.meins,
  lfa1.lifnr,
  lfa1.name1,
  concat_with_space(lfa1.stras, lfa1.mcod3, 1) as Satici_Adresi }
