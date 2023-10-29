import streamlit as st
import duckdb
import os

# Connect to your local DuckDB database
duckdb_path = 'C:/Personal Git Repos/getground_dbt/src/duckdb/dev/dbfile.duckdb'
conn = duckdb.connect(duckdb_path)

# streamlit config
st.set_page_config(layout="wide")

# Sample analysis functions
def answer_question_1():
  results = conn.execute('SELECT * FROM model.partner limit 10').df()
  return results

def answer_question_2():
  results = conn.execute('SELECT count(*) from model.partner').df()
  return results

def main():

  st.title('Data Analysis Tool')

  # Define the questions you want to answer
  question = st.selectbox('Select a question to answer:', ('Question 1', 'Question 2'))

  if question == 'Question 1':
      st.write('Answering Question 1:')
      answer = answer_question_1()
      st.dataframe(answer)  # You can modify the display of results based on your needs

  elif question == 'Question 2':
      st.write('Answering Question 2:')
      answer = answer_question_2()
      st.dataframe(answer)  # You can modify the display of results based on your needs

if __name__ == '__main__':
  main()
