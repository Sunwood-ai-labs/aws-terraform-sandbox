import streamlit as st
import pandas as pd
import numpy as np
import altair as alt

st.title('Simple Streamlit App V2')

# Generate some random data
data = pd.DataFrame({
    'x': np.random.randn(100),
    'y': np.random.randn(100)
})

# Create a scatter plot using Altair
chart = alt.Chart(data).mark_circle().encode(
    x='x',
    y='y'
)

# Display the chart using Streamlit
st.altair_chart(chart, use_container_width=True)

st.write('This is a simple Streamlit app that generates random data and displays a scatter plot.')
