import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

# ページ設定
st.set_page_config(page_title="にゃんこカフェ ダッシュボード", layout="wide")

# タイトル
st.title("にゃんこカフェ ダッシュボード")

# 仮のデータ
visitors_data = pd.DataFrame({
    'month': ['1月', '2月', '3月', '4月', '5月', '6月'],
    'visitors': [1200, 1900, 1600, 2200, 2500, 2300]
})

popular_cats_data = pd.DataFrame({
    'name': ['ミケ', 'ルナ', 'タマ', 'レオ', 'その他'],
    'value': [30, 25, 20, 15, 10]
})

# 統計カード
col1, col2, col3, col4 = st.columns(4)

with col1:
    st.metric(label="総来店者数", value="11,700", delta="+15%")

with col2:
    st.metric(label="売上", value="585,000円", delta="+8%")

with col3:
    st.metric(label="提供コーヒー数", value="8,940", delta="+12%")

with col4:
    st.metric(label="猫の譲渡数", value="23", delta="+4")

# グラフ
col1, col2 = st.columns(2)

with col1:
    st.subheader("月間来店者数")
    fig = px.bar(visitors_data, x='month', y='visitors', text='visitors')
    fig.update_traces(texttemplate='%{text:.2s}', textposition='outside')
    st.plotly_chart(fig, use_container_width=True)

with col2:
    st.subheader("人気の猫ちゃん")
    fig = px.pie(popular_cats_data, values='value', names='name', hole=.3)
    fig.update_traces(textposition='inside', textinfo='percent+label')
    st.plotly_chart(fig, use_container_width=True)

# 追加情報
st.markdown("""
---
### にゃんこカフェについて
にゃんこカフェは、猫好きの方々が美味しいコーヒーを楽しみながら、可愛い猫たちと触れ合える癒しの空間です。
また、猫の譲渡も行っており、素敵な家族との出会いをサポートしています。

私たちの使命は、猫と人間の両方にとってリラックスできる環境を提供し、動物福祉と猫との触れ合いの喜びを促進することです。
""")

# サイドバー（将来的な対話性のため）
st.sidebar.title("ダッシュボード設定")
st.sidebar.info("ここにダッシュボードデータを操作するためのフィルターやコントロールを追加できます。")

# ここに日付範囲セレクターや特定の猫のフィルターなど、
# より多くのインタラクティブな要素を追加できます。
