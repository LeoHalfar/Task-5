SELECT
    ri.rentable_instruments_id,
    ri.brand,
    ri.type_of_instrument
FROM
    rentable_instruments ri
LEFT JOIN
    renting_instruments rin ON ri.rentable_instruments_id = rin.rentable_instruments_id
WHERE
    ri.type_of_instrument = 'The instrument type'
    AND (rin.expired IS NOT NULL OR rin.rentable_instruments_id IS NULL);
