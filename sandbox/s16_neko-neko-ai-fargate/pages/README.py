import streamlit as st
import os

# ページ設定
st.set_page_config(
    page_title="README - ねこねこカンパニー",
    page_icon="🐱",
    layout="wide"
)

# サイドバー
with st.sidebar:
    st.image("https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png", width=200)
    st.title("ねこねこカンパニー")
    st.markdown("あなたの猫ちゃんライフをサポート！")

# READMEの表示
st.title("📄 README")
try:
    with open("README.md", "r", encoding="utf-8") as f:
        readme_content = f.read()
    st.markdown(readme_content, unsafe_allow_html=True)
except FileNotFoundError:
    st.error("README.mdが見つかりませんでした。")

# フッター
st.markdown("---")
st.markdown("© 2024 ねこねこカンパニー. All rights reserved.")
