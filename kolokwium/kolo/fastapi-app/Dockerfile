# First stage - builing the app
FROM python AS builder

WORKDIR /app

COPY requirements.txt .
COPY app.py .
RUN pip install -r requirements.txt
RUN pip install uvicorn

CMD ["uvicorn", "app:app", "--reload", "--port", "3000"]