{{
  config({    
    "materialized": "ephemeral",
    "database": "qa_team",
    "schema": "qa_orchestration"
  })
}}

WITH seed2 AS (

  SELECT * 
  
  FROM {{ ref('seed2')}}

),

fuzzy_match_accounts AS (

  {{ DatabricksSqlBasics.FuzzyMatch('seed2', 'PURGE', '', 'Record_ID', { 'custom': ['Name'] }, 80, true) }}

)

SELECT *

FROM fuzzy_match_accounts
