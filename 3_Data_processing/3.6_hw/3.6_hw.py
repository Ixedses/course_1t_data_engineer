from datetime import datetime
import random
import pandas as pd
from airflow import DAG
from airflow.models import Variable
from airflow.operators.bash import BashOperator
from airflow.operators.python_operator import PythonOperator

def hello():
    print('Airflow')


def task_12а():
    first_number = random.randint(1, 1000)
    second_number = random.randint(1, 1000)
    print(f'\nПервое число {first_number} \nВторое число {second_number}')


def task_12_e():
    from pathlib import Path
    path_to_file =  Variable.get("bucket") + 'readme.txt'
    path = Path(path_to_file)
    if path.is_file():
        fd=open("readme.txt","r")
        d=fd.read()
        fd.close()
        m=d.split("\n")
        s="\n".join(m[:-1])
        fd=open("readme.txt","w+")
        for i in range(len(s)):
            fd.write(s[i])
    else:
        pass


def task_12с_e():
    first_number = random.randint(500, 1000)
    second_number = random.randint(500, 1000)
    str_lines = str(f'{first_number} {second_number}')
    with open('readme.txt', 'a+') as f:
        f.write(f'\n{str_lines}')
        f.close()



def task_12d():
    data=pd.read_csv('readme.txt', sep=' ', header=None, names=['Column1', 'Column2'])
    sum_num = sum(data['Column1']) - sum(data['Column2'])
    with open('readme.txt', 'a') as f:
        f.write(f'\n{sum_num}')
        f.close()


with DAG (dag_id= 'first_dag', start_date= datetime.today(),schedule_interval= '0-5/1 * * * *') as dag:
    bash_task = BashOperator(task_id= 'hella', bash_command= 'echo hello')
    python_task = PythonOperator(task_id = 'world', python_callable= hello)
    python_task_12а = PythonOperator(task_id = 'task_12а', python_callable= task_12а)
    python_task_12e = PythonOperator(task_id = 'task_12e', python_callable= task_12_e)
    python_task_12c = PythonOperator(task_id = 'task_12c', python_callable= task_12с_e)
    python_task_12d = PythonOperator(task_id = 'task_12d', python_callable= task_12d)

bash_task >> python_task >> python_task_12а >> python_task_12e >> python_task_12c >> python_task_12d
