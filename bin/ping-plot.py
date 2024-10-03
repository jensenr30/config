#!/usr/bin/python

import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from datetime import datetime
import pytz


# Load the CSV file
file_path = '~/ping-record.csv'
data = pd.read_csv(file_path)

# Ensure columns are correct
if not {'time_s', 'address', 'ping_ms'}.issubset(data.columns):
    print("The CSV file doesn't contain the required columns: 'time_s', 'address', 'ping_ms'.")
    exit()

# replace nan with 1000 - timeout
data = data.fillna(1000)

# Convert time_s (Unix time) to datetime in UTC
data['datetime_utc'] = pd.to_datetime(data['time_s'], unit='s', utc=True)

# Define Central Time (CT) timezone including Daylight Savings
central_tz = pytz.timezone('America/Chicago')

# Convert the UTC datetime to Central Time
data['datetime_ct'] = data['datetime_utc'].dt.tz_convert(central_tz)

# Group by address
addresses = data['address'].unique()

# Create the plot
plt.figure(figsize=(10, 6))

# Plot for each address
for address in addresses:
    subset = data[data['address'] == address]
    plt.plot(subset['datetime_ct'], subset['ping_ms'], linestyle='-', marker='.', linewidth=0.8, label=address)

# Format x-axis as date
plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y-%m-%d %H:%M:%S', tz=central_tz))
plt.gca().xaxis.set_major_locator(mdates.AutoDateLocator())

# Rotate the date labels for better readability
plt.gcf().autofmt_xdate()

# Add labels and title
plt.xlabel('Central Time')
plt.ylabel('Ping (ms)')
plt.title('Ping over Time for Different Addresses')
plt.legend()
plt.grid(True)
plt.tight_layout()

# Show the plot
plt.show()
