@EndUserText.label: 'Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOK_SU_MRI
as projection on ZI_BOOK_SU_MRI
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      Price,
      CurrencyCode,
      /* Associations */
      _Booking : redirected to parent ZC_BOOKING_MRI,
      _Travel: redirected to ZC_TRAVEL_MRI
}
