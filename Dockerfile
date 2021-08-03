#Ashlin Darius Govindasamy

#syntax=docker/dockerfile:1
# parent image
FROM python:3.7-slim

# install FreeTDS and dependencies
RUN apt-get update \
 && apt-get install unixodbc -y \
 && apt-get install unixodbc-dev -y \
 && apt-get install freetds-dev -y \
 && apt-get install freetds-bin -y \
 && apt-get install tdsodbc -y \
 && apt-get install --reinstall build-essential -y

COPY . .

# populate "ocbcinst.ini"
RUN cp odbcinst.ini /etc/
RUN cp odbc.ini /etc/odbc.ini
RUN cp freetds.conf /etc/freetds/freetds.conf

# install pyodbc (and, optionally, sqlalchemy)
RUN pip3 install --trusted-host pypi.python.org pyodbc==4.0.26 sqlalchemy==1.3.5

# your modules here
# RUN pip3 install mymodule

# run your python app upon container launch (rename to your app) 
CMD ["python3","app.py"]


#ADGSTUDIOS 2021
