

```python
#import dependencies
import pandas as pd
import numpy as np

from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy import inspect, func
from sqlalchemy import Column, Date, Text, Integer, Float

from sqlalchemy.ext.declarative import declarative_base
Base = declarative_base()
```


```python
#read clean measurements and clean stations
clean_measurements_csv = "clean_measurements.csv"
clean_stations_csv = "clean_stations.csv"
measurement = clean_measurements_csv
station = clean_measurements_csv
```


```python
clean_measurements_df = pd.read_csv(clean_measurements_csv, header=0, dtype=object, na_filter = False)
clean_stations_df = pd.read_csv(clean_stations_csv)
```


```python
clean_measurements_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Unnamed: 0</th>
      <th>station</th>
      <th>date</th>
      <th>prcp</th>
      <th>tobs</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>USC00519397</td>
      <td>2010-01-01</td>
      <td>0.08</td>
      <td>65</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>USC00519397</td>
      <td>2010-01-02</td>
      <td>0.0</td>
      <td>63</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>USC00519397</td>
      <td>2010-01-03</td>
      <td>0.0</td>
      <td>74</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>USC00519397</td>
      <td>2010-01-04</td>
      <td>0.0</td>
      <td>76</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>USC00519397</td>
      <td>2010-01-06</td>
      <td>N/A</td>
      <td>73</td>
    </tr>
  </tbody>
</table>
</div>




```python
clean_stations_df.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Unnamed: 0</th>
      <th>station</th>
      <th>name</th>
      <th>latitude</th>
      <th>longitude</th>
      <th>elevation</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>USC00519397</td>
      <td>WAIKIKI 717.2, HI US</td>
      <td>21.2716</td>
      <td>-157.8168</td>
      <td>3.0</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>USC00513117</td>
      <td>KANEOHE 838.1, HI US</td>
      <td>21.4234</td>
      <td>-157.8015</td>
      <td>14.6</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>USC00514830</td>
      <td>KUALOA RANCH HEADQUARTERS 886.9, HI US</td>
      <td>21.5213</td>
      <td>-157.8374</td>
      <td>7.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>USC00517948</td>
      <td>PEARL CITY, HI US</td>
      <td>21.3934</td>
      <td>-157.9751</td>
      <td>11.9</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>USC00518838</td>
      <td>UPPER WAHIAWA 874.3, HI US</td>
      <td>21.4992</td>
      <td>-158.0111</td>
      <td>306.6</td>
    </tr>
  </tbody>
</table>
</div>




```python
engine = create_engine ("sqlite:///./Resources/hawaii.sqlite", echo=False)
conn = engine.connect()
base = declarative_base()
```


```python
# Reflect Database into ORM class
class Measurement(Base):
    __tablename__= "Measurements"
    id = Column(Integer, primary_key = True)
    date = Column(Date)
    prcp = Column(Float)
    tobs = Column(Integer)

class Station(Base):
    __tablename__="Stations"
    id = Column(Integer, primary_key = True)
    name = Column(Text)
    latitude = Column(Float)
    longitude = Column(Float)
    elevation = Column(Float)
```


```python
measurement.to_sql('measurements', conn, dtype={'id': Integer(), 'station': Text(), 'date': Text(), 'prcp': Float(), 
                                                'tobs': Integer()})
station.to_sql('stations', conn, dtype={'id': Integer(), 'station': Text(), 'name': Text(), 
                                        'latitude': Float(), 'longitude': Float(), 'elevation': Float()})
```
