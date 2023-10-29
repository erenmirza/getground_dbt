import streamlit as st
import duckdb
import os

SOURCE_PATH = 'C:/Personal Git Repos/getground_dbt/src'

# Connect to your local DuckDB database
duckdb_path = f'{SOURCE_PATH}/duckdb/dev/dbfile.duckdb'
conn = duckdb.connect(duckdb_path)

# streamlit config
st.set_page_config(layout="wide")

sql_queries_path = f'{SOURCE_PATH}/streamlit/sql_queries'

def get_sql_query(filepath):
  with open(filepath, 'r') as q:
    query = q.read()
  return query

def run_user_query(query):
    answer = conn.execute(query).df()
    return answer

def retrieve_answer(question, filepath):
    st.header(question)
    answer = conn.execute(get_sql_query(f'{sql_queries_path}/{filepath}')).df()
    return answer

def main():

  st.title('Data Analysis Tool')

  model_selection = st.selectbox('Select a model for DQ analysis:', (
    'Run Personal Query'
    , 'GG_PARTNERS'
    , 'GG_REFERRALS'
    , 'GG_SALES_CONTACTS'
    )
  )
  
  if model_selection == 'Run Personal Query':
    user_query = st.text_area('Enter your SQL query here:', height=100)
    if user_query:
      st.dataframe(run_user_query(query=user_query))
    else:
      pass

  elif model_selection == 'GG_PARTNERS':
    
      st.dataframe(retrieve_answer('Show an example record from this model', 'gg_partners_example_record.sql'))
      st.dataframe(retrieve_answer('How many rows are in this table?', 'gg_partners_row_count.sql'))
      st.text("""
              - One partner relates to a single row in this table
              - PARTNER_ID is the primary key
      """)
      
      st.dataframe(retrieve_answer('Show how many partners there are split by type?', 'gg_partners_count_by_partner_type.sql'))
      st.text("""
              - 8 partner types
              - Agent partner type is the most popular partner type
              - Partner data limited to 2020-08 to 2021-05
              - Acronym IFA should be avoided in reporting unless required, will always lead to the question of what it stands for
      """)
      
      df1 = retrieve_answer('Show how many partners are created per month split by type', 'gg_partners_created_per_month.sql')
      st.bar_chart(data=df1, x='YEAR_MONTH', y='cnt', color='partner_type')
      st.text("""
              - Many partners created in first few months of 2021
              - Unexpected dip in 2021-03 followed by an increase in 2021-04 
              - Possibly due to pandemic and increase in house prices during that time
      """)

      df2 = retrieve_answer('Show the cumulative growth of partner creation by type', 'gg_partners_cumulative_creation.sql')
      st.line_chart(data=df2, x='YEAR_MONTH', y='cumulative_count', color='partner_type')
      st.text("""
              - Similar graph to before, but can visualise where growth is prominent and steadying off
      """)

  elif model_selection == 'GG_SALES_CONTACTS':
    
      st.dataframe(retrieve_answer('Show an example record from this model', 'gg_sales_contacts_example_record.sql'))
      st.dataframe(retrieve_answer('How many sales contacts are there?', 'gg_sales_contacts_row_count.sql'))
      st.text("""
              - One row relates to a single sales contact operating in one of the offices
              - There are no name duplicates in the table, however as name is likely to be duplicated, the primary key is assumed to be
              name concatenated with the office country
      """)
      df3 = retrieve_answer('How many sales contacts operate in each office?', 'gg_sales_contacts_by_office.sql')
      st.bar_chart(data=df3, x='SALES_CONTACT_COUNTRY_NAME', y='CNT', color='SALES_CONTACT_COUNTRY_NAME')
      st.text("""
              - 12 sales contacts
              - Most in UK
              - Least in HongKong
              - Naming of countries is unconventional, mapping may be requried
      """)


if __name__ == '__main__':
  main()
