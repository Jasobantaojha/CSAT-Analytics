use project_csat_analytics;

select * from CSAT limit 10;

SELECT COUNT(*) AS Total_Calls
FROM CSAT;

SELECT
    sentiment,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY sentiment
ORDER BY Total_Calls DESC;

SELECT
    AVG(csat_score) AS Average_CSAT
FROM CSAT;

USE project_csat_analytics;

SHOW TABLES;

DESCRIBE CSAT;

SELECT
    channel,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY channel
ORDER BY Total_Calls DESC;

SELECT
    reason,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY reason
ORDER BY Total_Calls DESC;

SELECT
    state,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY state
ORDER BY Total_Calls DESC;

SELECT
    response_time,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY response_time
ORDER BY Total_Calls DESC;

SELECT
    DATE(call_timestamp) AS Call_Date,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY DATE(call_timestamp)
ORDER BY Call_Date;

SELECT
    COUNT(*) AS Total_Records,
    COUNT(call_timestamp) AS Valid_Timestamps
FROM CSAT;

SELECT
    STR_TO_DATE(call_timestamp, '%m/%d/%Y') AS Call_Date,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY STR_TO_DATE(call_timestamp, '%m/%d/%Y')
ORDER BY Call_Date;

SELECT
    call_timestamp
FROM CSAT
WHERE call_timestamp IS NOT NULL
AND STR_TO_DATE(
    TRIM(call_timestamp),
    '%m/%d/%Y'
) IS NULL
LIMIT 20;

SELECT
    COUNT(*) AS Total_Records,

    SUM(
        CASE
            WHEN call_timestamp LIKE '%/%'
            THEN 1 ELSE 0
        END
    ) AS Slash_Format,

    SUM(
        CASE
            WHEN call_timestamp LIKE '%-%'
            THEN 1 ELSE 0
        END
    ) AS Hyphen_Format

FROM CSAT;

SELECT
    CASE
        WHEN call_timestamp LIKE '%/%'
        THEN STR_TO_DATE(
            TRIM(call_timestamp),
            '%m/%d/%Y'
        )

        WHEN call_timestamp LIKE '%-%'
        THEN STR_TO_DATE(
            TRIM(call_timestamp),
            '%m-%d-%Y'
        )
    END AS Call_Date,

    COUNT(*) AS Total_Calls

FROM CSAT

GROUP BY Call_Date

ORDER BY Call_Date;

SELECT
    DATE_FORMAT(
        CASE
            WHEN call_timestamp LIKE '%/%'
            THEN STR_TO_DATE(
                TRIM(call_timestamp), '%m/%d/%Y'
            )
            WHEN call_timestamp LIKE '%-%'
            THEN STR_TO_DATE(
                TRIM(call_timestamp), '%m-%d-%Y'
            )
        END,
        '%Y-%m'
    ) AS Call_Month,

    COUNT(*) AS Total_Calls

FROM CSAT

GROUP BY Call_Month

ORDER BY Call_Month;

SELECT
    channel,
    COUNT(*) AS Total_Calls,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM CSAT),
        2
    ) AS Percentage

FROM CSAT

GROUP BY channel

ORDER BY Total_Calls DESC;

SELECT
    ROUND(AVG(csat_score), 2) AS Average_CSAT,
    MIN(csat_score) AS Minimum_CSAT,
    MAX(csat_score) AS Maximum_CSAT,
    COUNT(*) AS Total_Calls
FROM CSAT;

SELECT
    sentiment,
    COUNT(*) AS Total_Calls,
    ROUND(AVG(csat_score), 2) AS Average_CSAT
FROM CSAT
GROUP BY sentiment
ORDER BY Average_CSAT DESC;

SELECT
    reason,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY reason
ORDER BY Total_Calls DESC;

SELECT
    state,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY state
ORDER BY Total_Calls DESC;

SELECT
    response_time,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY response_time
ORDER BY Total_Calls DESC;

select * from CSAT;