INSERT INTO bi_data.valid_offers
  (offer_id, hotel_id, price_usd, original_price, original_currency_code,
  checkin_date, checkout_date, breakfast_included_flag, valid_from_date, valid_to_date)

SELECT
  of.id,
  of.hotel_id,
  of.sellings_price as price_usd,
  of.sellings_price as original_price,
  lc.code AS original_currency_code,
  of.checkin_date,
  of.checkout_date,
  of.breakfast_included_flag,
  of.offer_valid_from,
  of.offer_valid_to
FROM
  enterprise_data.offer_cleanse_date_fix of,
  primary_data.lst_currency lc
WHERE 1=1
  AND of.currency_id=1
  AND lc.id=1;
