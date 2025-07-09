@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZRAP_BOOK_SU_MRI'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOK_SU_MRI as select from zrap_book_su_mri
association to parent ZI_BOOKING_MRI as _Booking on $projection.TravelId = _Booking.TravelId and $projection.BookingId = _Booking.BookingId
association to ZI_TRAVEL_MRI as _Travel on $projection.TravelId = _Travel.TravelId
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    key booking_supplement_id as BookingSupplementId,
    supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,
    _Booking,
    _Travel
}
