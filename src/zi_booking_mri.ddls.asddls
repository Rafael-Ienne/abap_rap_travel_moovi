@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZRAP_BOOKING_MRI'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_BOOKING_MRI as select from zrap_booking_mri
composition[0..*] of ZI_BOOK_SU_MRI as _Booking_Suppl 
association to parent ZI_TRAVEL_MRI as _Travel on $projection.TravelId = _Travel.TravelId 
association[1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
association[1..1] to /DMO/I_Connection as _Connection on $projection.ConnectionId = _Connection.ConnectionID and $projection.CarrierId = _Connection.AirlineID
association[0..1] to /DMO/I_Booking_Status_VH as _BookingStatus on $projection.booking_status = _BookingStatus.BookingStatus 
{
    key travel_id as TravelId,
    key booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    booking_status,
    _Travel,
    _Carrier,
    _Customer,
    _Connection,
    _BookingStatus,
    _Booking_Suppl 
}
