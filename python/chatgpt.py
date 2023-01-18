import pandas as pd

# Create a DataFrame from your data
data = {'name': ['John', 'Jane', 'Bob'],
        'age': [30, 25, 35],
        'city': ['New York', 'Los Angeles', 'Chicago']}
df = pd.DataFrame(data)

# Write the DataFrame to an Excel file
df.to_excel('report.xlsx', index=False)
