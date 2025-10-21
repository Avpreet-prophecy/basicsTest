WITH p1_1 AS (

  SELECT * 
  
  FROM {{ ref('p1')}}

),

Reformat_1 AS (

  SELECT * 
  
  FROM p1_1 AS in0

)

SELECT *

FROM Reformat_1
