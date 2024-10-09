import streamlit as st
from litellm import completion
import os

os.environ["LITELLM_LOG"] = "INFO"

# AWS認証情報の設定
# os.environ["AWS_ACCESS_KEY_ID"] = "YOUR_AWS_ACCESS_KEY_ID"
# os.environ["AWS_SECRET_ACCESS_KEY"] = "YOUR_AWS_SECRET_ACCESS_KEY"
# os.environ["AWS_DEFAULT_REGION"] = "us-east-1"
os.environ["AWS_REGION_NAME"] = "us-east-1"
# os.environ["AWS_REGION_NAME"] = "ap-northeast-1"

# ページ設定
st.set_page_config(
    page_title="ねこねこカンパニー AIアシスタント",
    page_icon="🐱",
    layout="wide"
)

# CSSでページスタイルをカスタマイズ
st.markdown("""
<style>
    .stApp {
        background: linear-gradient(to bottom, #E3E0DC, #B1AEA9);  /* グラデーション背景（上が明るいグレー、下がやや濃いグレーがかったベージュ） */
    }
    .stTextInput > div > div > input {
        background-color: #E8E8E8;  /* 薄めのニュートラルな背景色（ライトグレー） */
        color: #3A332C;  /* 濃いニュートラルカラー（暗めのブラウン系グレー） */
    }
    .stButton > button {
        background: linear-gradient(to right, #4B2F23, #736F6A);  /* ボタンにグラデーション（左が深いダークブラウン、右が落ち着いたブラウン） */
        color: #E8E8E8;  /* 薄めのニュートラルな背景色（ライトグレー） */
    }
    .chat-message {
        padding: 1rem;
        border-radius: 0.5rem;
        margin-bottom: 1rem;
        display: flex;
    }
    .chat-message.user {
        background: linear-gradient(to right, #E3E0DC, #B1AEA9);  /* ユーザーメッセージにグラデーション（左が明るいグレー、右がやや濃いベージュ） */
        color: #E8E8E8;  /* 濃いニュートラルカラー（暗めのブラウン系グレー） */
    }
    .chat-message.bot {
        background: linear-gradient(to right, #736F6A, #4B2F23);  /* ボットメッセージにグラデーション（左がグレーがかったブラウン、右が深いダークブラウン） */
        color: #E8E8E8;  /* 濃いニュートラルカラー（暗めのブラウン系グレー） */
    }
    .chat-message .avatar {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 1rem;
    }
    .chat-message .message {
        flex-grow: 1;
    }
</style>
""", unsafe_allow_html=True)


# サイドバー
with st.sidebar:
    st.image("https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png", width=200)
    st.title("ねこねこカンパニー")
    st.markdown("あなたの猫ちゃんライフをサポート！")

# メインコンテンツ
st.title("🐱 ねこねこAIアシスタント")

# チャット履歴の初期化
if "messages" not in st.session_state:
    st.session_state.messages = [
        {"role": "assistant", "content": "こんにちは！ねこねこカンパニーのAIアシスタントにゃ。何か質問があればお聞かせくださいニャン🐾"}
    ]

# チャット履歴の表示
for message in st.session_state.messages:
    if message["role"] == "user":
        with st.container():
            st.markdown(f"""
            <div class="chat-message user">
                <img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png" class="avatar">
                <div class="message">{message["content"]}</div>
            </div>
            """, unsafe_allow_html=True)
    else:
        with st.container():
            st.markdown(f"""
            <div class="chat-message bot">
                <img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png" class="avatar">
                <div class="message">{message["content"]}</div>
            </div>
            """, unsafe_allow_html=True)

# ユーザー入力
user_input = st.text_input("ねこねこカンパニーについて質問してください", key="user_input")

if user_input:
    st.session_state.messages.append({"role": "user", "content": user_input})
    
    with st.spinner("考え中..."):
        # response = completion(
        #     model="bedrock/us.anthropic.claude-3-haiku-20240307-v1:0",
        #     messages=[
        #         {"role": "system", "content": "あなたはねこねこカンパニーの親切な猫型AIアシスタントです。ユーザーの質問に対して、猫らしい口調で答えてください。"},
        #         {"role": "user", "content": user_input}
        #     ]
        # )
        
        response = completion(
            model="bedrock/us.anthropic.claude-3-haiku-20240307-v1:0",
            messages=[{ "content": user_input,"role": "user"}],
            aws_region_name="us-east-1",
        )
    
    ai_response = response.choices[0].message.content
    st.session_state.messages.append({"role": "assistant", "content": ai_response})
    
    # 最新の応答を表示
    with st.container():
        st.markdown(f"""
        <div class="chat-message bot">
            <img src="https://huggingface.co/datasets/MakiAi/IconAssets/resolve/main/neko-neko-ai.png" class="avatar">
            <div class="message">{ai_response}</div>
        </div>
        """, unsafe_allow_html=True)

# チャットをクリアするボタン
if st.button("チャットをクリア"):
    st.session_state.messages = [
        {"role": "assistant", "content": "こんにちは！ねこねこカンパニーのAIアシスタントにゃ。何か質問があればお聞かせくださいニャン🐾"}
    ]
    st.experimental_rerun()

# フッター
st.markdown("---")
st.markdown("© 2024 ねこねこカンパニー. All rights reserved.")
