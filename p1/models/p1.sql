WITH dep1 AS (

  SELECT * 
  
  FROM {{ ref('dep1')}}

),

TextToColumns_1 AS (

  {{
    DatabricksSqlBasics.TextToColumns(
      'dep1', 
      'Beneficiaries', 
      ";", 
      'splitColumns', 
      3, 
      'Leave extra in last column', 
      'root', 
      'generated', 
      'generated_column'
    )
  }}

)

SELECT *

FROM TextToColumns_1
