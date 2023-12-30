SELECT
    ri.rentable_instruments_id,
    ri.brand,
    ri.type_of_instrument
FROM
    rentable_instruments ri
LEFT JOIN (
    SELECT
        rentable_instruments_id,
        COUNT(rentable_instruments_id) AS total_rented,
        COUNT(expired) AS expired_count
    FROM
        renting_instruments
    GROUP BY
        rentable_instruments_id
) rin_counts ON ri.rentable_instruments_id = rin_counts.rentable_instruments_id
WHERE
    ri.type_of_instrument = 'Piano'
    AND (rin_counts.rentable_instruments_id IS NULL OR rin_counts.total_rented = rin_counts.expired_count);
