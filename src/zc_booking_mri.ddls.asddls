@EndUserText.label: 'Projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_BOOKING_MRI
as projection on ZI_BOOKING_MRI
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    booking_status,
    /* Associations */
    _BookingStatus,
    _Booking_Suppl: redirected to composition child ZC_BOOK_SU_MRI,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZC_TRAVEL_MRI
}
