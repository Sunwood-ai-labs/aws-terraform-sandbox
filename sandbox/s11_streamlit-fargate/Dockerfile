FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 8501

CMD ["streamlit", "run", "app.py"]

# ----------
#
# docker build -t makisunwood/streamlit-app:latest . 
# docker run -p 8501:8501 makisunwood/streamlit-app:latest
# docker push makisunwood/streamlit-app:latest
