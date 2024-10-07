import streamlit as st
import pandas as pd
import numpy as np

st.set_page_config(page_title='ねこねこカンパニー 工場ダッシュボード', layout='wide')

# 会社のロゴを表示（適切な画像ファイルに置き換えてください）
st.image("nekoneko_logo.png", use_column_width=True)

st.title("ねこねこカンパニー 工場ダッシュボード")

# 架空のデータを生成

# 過去30日間の日付
date_range = pd.date_range(end=pd.Timestamp.today(), periods=30)

# 生産状況データ
production_data = pd.DataFrame({
    '日付': date_range,
    '生産数': np.random.randint(80, 120, size=30)
})

# 品質管理データ
defect_types = ['キズ', '色ムラ', 'サイズ不良', 'その他']
quality_data = pd.DataFrame({
    '日付': date_range,
    '不良率 (%)': np.random.uniform(1, 5, size=30),
    '不良品数': np.random.randint(1, 10, size=30),
    '不良種別': np.random.choice(defect_types, size=30)
})

# 在庫状況データ
products = ['ねこぬいぐるみ', 'ねこクッション', 'ねこマグカップ', 'ねこTシャツ']
inventory_data = pd.DataFrame({
    '製品': products,
    '在庫数': np.random.randint(100, 500, size=len(products))
})

# 従業員効率データ
departments = ['組立', '検査', '梱包', '出荷']
employee_efficiency = pd.DataFrame({
    '部署': departments,
    '平均効率 (%)': np.random.uniform(70, 100, size=len(departments))
})

# 機械稼働率データ
machines = ['機械A', '機械B', '機械C', '機械D']
machine_utilization = pd.DataFrame({
    '機械': machines,
    '稼働率 (%)': np.random.uniform(60, 100, size=len(machines))
})

# 受注と出荷データ
orders_data = pd.DataFrame({
    '日付': date_range,
    '受注数': np.random.randint(50, 150, size=30),
    '出荷数': np.random.randint(40, 140, size=30)
})

# タブを作成
tabs = st.tabs(["生産状況", "品質管理", "在庫状況", "従業員効率", "機械稼働率", "受注と出荷"])

# 生産状況タブ
with tabs[0]:
    st.header("生産状況")
    st.line_chart(production_data.set_index('日付')['生産数'])
    st.dataframe(production_data)

# 品質管理タブ
with tabs[1]:
    st.header("品質管理")
    st.line_chart(quality_data.set_index('日付')['不良率 (%)'])
    st.bar_chart(quality_data.set_index('日付')['不良品数'])
    st.dataframe(quality_data)

# 在庫状況タブ
with tabs[2]:
    st.header("在庫状況")
    st.bar_chart(inventory_data.set_index('製品')['在庫数'])
    st.dataframe(inventory_data)

# 従業員効率タブ
with tabs[3]:
    st.header("従業員効率")
    st.bar_chart(employee_efficiency.set_index('部署')['平均効率 (%)'])
    st.dataframe(employee_efficiency)

# 機械稼働率タブ
with tabs[4]:
    st.header("機械稼働率")
    st.bar_chart(machine_utilization.set_index('機械')['稼働率 (%)'])
    st.dataframe(machine_utilization)

# 受注と出荷タブ
with tabs[5]:
    st.header("受注と出荷")
    st.line_chart(orders_data.set_index('日付')[['受注数', '出荷数']])
    st.dataframe(orders_data)

# 必要に応じて追加の情報やメトリクスを表示できます
