E
Heroes of Pymoli Data Analysis
1.  Of the 1163 active players, the vast majority are male (82%). There also exists, a smaller, but notable proportion of female players (16%).
2.  Our peak age demographic falls between 20-24 (42%) with secondary groups falling between 15-19 (17.80%) and 25-29 (15.48%).
3.  Our players are putting in significant cash during the lifetime of their gameplay. Across all major age and gender demographics, the average purchase for a user is roughly $491.


```python
import os
import pandas as pd
import json
```


```python
file="Instructions/HeroesofPymoli/purchase_data.json"
```


```python
items="Generators/HeroesofPymoli/generated_data/items_complete.csv"
```


```python
items = pd.read_csv(items)
items.head()
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
<table border="1" class="dataframe">D
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Splinter</td>
      <td>1.89</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Crucifer</td>
      <td>3.67</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Verdict</td>
      <td>2.65</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Phantomlight</td>
      <td>4.15</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bloodlord's Fetish</td>
      <td>1.91</td>
    </tr>
  </tbody>
</table>
</div>




```python
players="Generators/HeroesofPymoli/generated_data/players_complete.csv"
```


```python
players=pd.read_csv(players)
players.head()
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
      <th>Player ID</th>
      <th>SN</th>
      <th>Age</th>
      <th>Gender</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Marughi89</td>
      <td>21</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Lirtedy26</td>
      <td>40</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Chamistast30</td>
      <td>7</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Lisirra25</td>
      <td>24</td>
      <td>Male</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Lirtim36</td>
      <td>23</td>
      <td>Male</td>
    </tr>
  </tbody>
</table>
</div>




```python
purchases="Generators/HeroesofPymoli/generated_data/purchase_data_3.csv"
```


```python
purchases=pd.read_csv(purchases)
purchases.head()
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
      <th>Purchase ID</th>
      <th>SN</th>
      <th>Age</th>
      <th>Gender</th>
      <th>Item ID</th>
      <th>Item Name</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Iloni35</td>
      <td>20</td>
      <td>Male</td>
      <td>93</td>
      <td>Apocalyptic Battlescythe</td>
      <td>4.49</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Aidaira26</td>
      <td>21</td>
      <td>Male</td>
      <td>12</td>
      <td>Dawne</td>
      <td>3.36</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Irim47</td>
      <td>17</td>
      <td>Male</td>
      <td>5</td>
      <td>Putrid Fan</td>
      <td>2.63</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Irith83</td>
      <td>17</td>
      <td>Male</td>
      <td>123</td>
      <td>Twilight's Carver</td>
      <td>2.55</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Philodil43</td>
      <td>22</td>
      <td>Male</td>
      <td>154</td>
      <td>Feral Katana</td>
      <td>4.11</td>
    </tr>
  </tbody>
</table>
</div>



PLAYER COUNT


```python
# Total Number of Players
playersNum = players.shape[0]
pd.DataFrame({"Number of Players": [playersNum]})
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
      <th>Number of Players</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1163</td>
    </tr>
  </tbody>
</table>
</div>



 PURCHASING ANALYSIS (TOTAL)


```python
# Number of unique items
unique_item = len(purchases['Item ID'].unique())
# Average purchase price
average_purchase = purchases['Price'].mean()
# Total number of purchases
total_purchases = purchases.shape[0]
# Total revenue
total_revenue = purchases.Price.sum()
pd.DataFrame({'Number of Unique Items':[unique_item],'Average Purchase Price':['${:,.2f}'.format(average_purchase)],
               'Total Number of Purchases':[total_purchases],'Total Revenue': ['${:,.2f}'.format(total_revenue)]
             })
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
      <th>Average Purchase Price</th>
      <th>Number of Unique Items</th>
      <th>Total Number of Purchases</th>
      <th>Total Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>$2.92</td>
      <td>64</td>
      <td>78</td>
      <td>$228.10</td>
    </tr>
  </tbody>
</table>
</div>



GENDER DEMOGRAPHICS


```python
# Percentage and count of male players
# Percentage and count of female players
# Percentage and count of other/non-disclosed
total_group=purchases.groupby(["Gender"]).count().iloc[:,0]
percentage=total_group/sum(total_group)
df = pd.DataFrame({'Percentage of Players':(percentage * 100),
              'Total Count': total_group}).sort_values('Total Count', ascending = False)
df.index.name = ''
df=df.round(2)
df
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
      <th>Percentage of Players</th>
      <th>Total Count</th>
    </tr>
    <tr>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Male</th>
      <td>82.05</td>
      <td>64</td>
    </tr>
    <tr>
      <th>Female</th>
      <td>16.67</td>
      <td>13</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>1.28</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



Purchasing Analysis (Gender)


```python
#Purchase Count
#Average Purchase Price
#Total Purchase Value
#Normalized Totals
purchase_value = purchases.groupby('Gender').sum()['Price']
average_purchase = purchase_value / total_group
df2 = pd.DataFrame({'Purchase Count': total_group,'Average Purchase Price': average_purchase.map('${:,.2f}'.format),
                    'Total Purchase Value': purchase_value.map('${:,.2f}'.format),'Normalized Totals': (purchase_value / playersNum).map('${:,.2f}'.format)})
df2 = df2[['Purchase Count', 'Average Purchase Price', 'Total Purchase Value', 'Normalized Totals']]
df2

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
      <th>Purchase Count</th>
      <th>Average Purchase Price</th>
      <th>Total Purchase Value</th>
      <th>Normalized Totals</th>
    </tr>
    <tr>
      <th>Gender</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Female</th>
      <td>13</td>
      <td>$3.18</td>
      <td>$41.38</td>
      <td>$0.04</td>
    </tr>
    <tr>
      <th>Male</th>
      <td>64</td>
      <td>$2.88</td>
      <td>$184.60</td>
      <td>$0.16</td>
    </tr>
    <tr>
      <th>Other / Non-Disclosed</th>
      <td>1</td>
      <td>$2.12</td>
      <td>$2.12</td>
      <td>$0.00</td>
    </tr>
  </tbody>
</table>
</div>



Age Demographics


```python
#The below each broken into bins of 4 years (i.e. <10, 10-14, 15-19, etc.)
bins = [0, 10, 14, 19, 24, 29, 34, 39, 40]
age_group = ['<10', '10-14', '15-19', '20-24', '25-29', '30-34', '35-39', '+40']
#Purchase Count
#Average Purchase Price
#Total Purchase Value
#Normalized Totals
df3 = pd.cut(purchases['Age'], bins=bins, labels=age_group).to_frame().Age.value_counts(sort = False).to_frame()
df3['Percentage'] = round(df3.Age / df3.Age.sum()*100, 2)
df3.columns = ['Total Count', 'Percentage of Players']
df3 = df3[['Percentage of Players', 'Total Count']]
df3

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
      <th>Percentage of Players</th>
      <th>Total Count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>&lt;10</th>
      <td>6.41</td>
      <td>5</td>
    </tr>
    <tr>
      <th>10-14</th>
      <td>3.85</td>
      <td>3</td>
    </tr>
    <tr>
      <th>15-19</th>
      <td>14.10</td>
      <td>11</td>
    </tr>
    <tr>
      <th>20-24</th>
      <td>46.15</td>
      <td>36</td>
    </tr>
    <tr>
      <th>25-29</th>
      <td>11.54</td>
      <td>9</td>
    </tr>
    <tr>
      <th>30-34</th>
      <td>8.97</td>
      <td>7</td>
    </tr>
    <tr>
      <th>35-39</th>
      <td>7.69</td>
      <td>6</td>
    </tr>
    <tr>
      <th>+40</th>
      <td>1.28</td>
      <td>1</td>
    </tr>
  </tbody>
</table>
</div>



Top Spenders


```python
#Identify the the top 5 spenders in the game by total purchase value, then list (in a table):
#SN
#Purchase Count
#Average Purchase Price
#Total Purchase Value
df4 = purchases.groupby('SN')['Price'].sum().sort_values(ascending = False).to_frame()
df4.columns = ['Total Purchase Value']
df4['Purchase Count'] = purchases.groupby('SN')['SN'].count()
df4['Average Purchase Price'] = (df4['Total Purchase Value'] / df4['Purchase Count']).map('${:,.2f}'.format)
df4['Total Purchase Value'] = df4['Total Purchase Value'].map('${:,.2f}'.format)
df4 = df4.iloc[:, [1,2,0]]
df4.head()
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
      <th>Purchase Count</th>
      <th>Average Purchase Price</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>SN</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Sundaky74</th>
      <td>2</td>
      <td>$3.71</td>
      <td>$7.41</td>
    </tr>
    <tr>
      <th>Aidaira26</th>
      <td>2</td>
      <td>$2.56</td>
      <td>$5.13</td>
    </tr>
    <tr>
      <th>Eusty71</th>
      <td>1</td>
      <td>$4.81</td>
      <td>$4.81</td>
    </tr>
    <tr>
      <th>Chanirra64</th>
      <td>1</td>
      <td>$4.78</td>
      <td>$4.78</td>
    </tr>
    <tr>
      <th>Alarap40</th>
      <td>1</td>
      <td>$4.71</td>
      <td>$4.71</td>
    </tr>
  </tbody>
</table>
</div>



Most Popular Items


```python
#Identify the 5 most popular items by purchase count, then list (in a table):
#Item ID
#Item Name
#Purchase Count
#Item Price
#Total Purchase Value
df5 = purchases.groupby(['Item ID', 'Item Name'])['Item ID'].count().sort_values(ascending = False).to_frame()
df5.columns = ['Purchase Count']
df5['Total Purchase Value'] = purchases.groupby(['Item ID', 'Item Name'])['Price'].sum()
df5['Item Price'] = (df5['Total Purchase Value'] / df5['Purchase Count']).map('${:,.2f}'.format)
df5['Total Purchase Value'] = df5['Total Purchase Value'].map('${:,.2f}'.format)
df5 = df5.iloc[:, [0,2,1]]
df5.head()

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
      <th></th>
      <th>Purchase Count</th>
      <th>Item Price</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>Item ID</th>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>94</th>
      <th>Mourning Blade</th>
      <td>3</td>
      <td>$3.64</td>
      <td>$10.92</td>
    </tr>
    <tr>
      <th>98</th>
      <th>Deadline, Voice Of Subtlety</th>
      <td>2</td>
      <td>$1.29</td>
      <td>$2.58</td>
    </tr>
    <tr>
      <th>117</th>
      <th>Heartstriker, Legacy of the Light</th>
      <td>2</td>
      <td>$4.71</td>
      <td>$9.42</td>
    </tr>
    <tr>
      <th>111</th>
      <th>Misery's End</th>
      <td>2</td>
      <td>$1.79</td>
      <td>$3.58</td>
    </tr>
    <tr>
      <th>154</th>
      <th>Feral Katana</th>
      <td>2</td>
      <td>$4.11</td>
      <td>$8.22</td>
    </tr>
  </tbody>
</table>
</div>



Most Profitable Items


```python
#Identify the 5 most profitable items by total purchase value, then list (in a table):
#Item ID
#Item Name
#Purchase Count
#Item Price
#Total Purchase Value
df6 = purchases.groupby(['Item ID', 'Item Name'])['Price'].sum().sort_values(ascending = False).to_frame()
df6.columns = ['Total Purchase Value']
df6['Purchase Count'] = purchases.groupby(['Item ID', 'Item Name'])['Item ID'].count()
df6['Item Price'] = (df6['Total Purchase Value'] / df6['Purchase Count']).map('${:,.2f}'.format)
df6['Total Purchase Value'] = df6['Total Purchase Value'].map('${:,.2f}'.format)
df6 = df6.iloc[:, [1,2,0]]
df6.head()
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
      <th></th>
      <th>Purchase Count</th>
      <th>Item Price</th>
      <th>Total Purchase Value</th>
    </tr>
    <tr>
      <th>Item ID</th>
      <th>Item Name</th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>94</th>
      <th>Mourning Blade</th>
      <td>3</td>
      <td>$3.64</td>
      <td>$10.92</td>
    </tr>
    <tr>
      <th>117</th>
      <th>Heartstriker, Legacy of the Light</th>
      <td>2</td>
      <td>$4.71</td>
      <td>$9.42</td>
    </tr>
    <tr>
      <th>93</th>
      <th>Apocalyptic Battlescythe</th>
      <td>2</td>
      <td>$4.49</td>
      <td>$8.98</td>
    </tr>
    <tr>
      <th>90</th>
      <th>Betrayer</th>
      <td>2</td>
      <td>$4.12</td>
      <td>$8.24</td>
    </tr>
    <tr>
      <th>154</th>
      <th>Feral Katana</th>
      <td>2</td>
      <td>$4.11</td>
      <td>$8.22</td>
    </tr>
  </tbody>
</table>
</div>


