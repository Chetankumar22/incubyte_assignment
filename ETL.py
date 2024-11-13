from sqlalchemy import create_engine,text
import pandas as pd
import sys
from datetime import datetime

DATABASE_URL = 'postgresql+psycopg2://cvuser:cvuser@localhost:5432/cvdb'
engine = create_engine(DATABASE_URL)

def calculate_age(dob): # To calculate age
    today = datetime.today()
    return today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))

def update_country_table(df, country_name): # to update country-wise tables from all_customer table
    country_df = df[df['country'] == country_name]
    table_name = f"Table_{country_name.lower()}"
    for index, row in country_df.iterrows():
        customer_id = row['customer_id']
        last_consulted_date = row['last_consulted_date']
        
        existing_query = f"""
        SELECT last_consulted_date FROM {table_name}
        WHERE customer_id = '{customer_id}'
        """
        existing_data = pd.read_sql(existing_query, engine)
        # checking if customer already exist in same country table
        if existing_data.empty or existing_data.iloc[0]['last_consulted_date'] < last_consulted_date:
            insert_query = f"""
            INSERT INTO {table_name} (customer_id, customer_name, open_date, last_consulted_date, vaccination_id, 
            dr_name, state, country, dob, is_active, age, days_since_last_consulted)
            VALUES ('{row['customer_id']}', '{row['customer_name']}', '{row['open_date']}', '{row['last_consulted_date']}',
            '{row['vaccination_id']}', '{row['dr_name']}', '{row['state']}', '{row['country']}','{row['dob']}', '{row['is_active']}', {row['age']}, {row['days_since_last_consulted']})
            """
            with engine.connect() as connection:
                connection.execute(text(insert_query))
                connection.commit()
            
        else:
            # 
            update_query = f"""
            UPDATE {table_name}
            SET customer_name = '{row['customer_name']}',
                open_date = '{row['open_date']}',
                last_consulted_date = '{row['last_consulted_date']}',
                vaccination_id = '{row['vaccination_id']}',
                dr_name = '{row['dr_name']}',
                state = '{row['state']}',
                dob = '{row['dob']}',
                is_active = '{row['is_active']}',
                age = {row['age']},
                days_since_last_consulted = {row['days_since_last_consulted']}
            WHERE customer_id = '{customer_id}'
            """

            with engine.connect() as connection:
                connection.execute(text(update_query))
                connection.commit()
def main():
    query = "select * from all_customers"
    chunk_size=10
    for chunk in pd.read_sql(query, engine, chunksize=chunk_size):
        chunk['dob'] = pd.to_datetime(chunk['dob'], format='%Y%m%d')
        chunk['last_consulted_date'] = pd.to_datetime(chunk['last_consulted_date'], format='%Y%m%d')
        chunk['age'] = chunk['dob'].apply(calculate_age)
        chunk['days_since_last_consulted'] = (datetime.today() - chunk['last_consulted_date']).dt.days

        for country in chunk['country'].unique():
            update_country_table(chunk, country)

if __name__ == "__main__":
    main()