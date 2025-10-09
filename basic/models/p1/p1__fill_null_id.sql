{{
  config({    
    "materialized": "ephemeral",
    "database": "qa_team",
    "schema": "qa_orchestration"
  })
}}

WITH people_10_k_records AS (

  SELECT * 
  
  FROM {{ source('qa_team.av', 'people_10_k_records') }}

),

fill_null_id AS (

  {{
    prophecy_basics.DataCleansing(
      'people_10_k_records', 
      [
        { "name": "id", "dataType": "Bigint" }, 
        { "name": "first_name", "dataType": "String" }, 
        { "name": "last_name", "dataType": "String" }
      ], 
      'Keep original', 
      ['id'], 
      true, 
      'qwe', 
      false, 
      0, 
      false, 
      false, 
      false, 
      false, 
      false, 
      false, 
      false, 
      false, 
      '1970-01-01', 
      false, 
      '1970-01-01 00:00:00.0'
    )
  }}

)

SELECT *

FROM fill_null_id
