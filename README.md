# Chatbot_Interaction_Analysis
## 📌 Overview
This project analyzes chatbot conversation logs to evaluate performance, identify failure points, and improve user experience.    The analysis focuses on key conversational metrics such as fallback rate, resolution rate, intent performance, and conversation flow to derive actionable business insights.


# 🤖 Chatbot Performance & Conversation Analytics Dashboard
## 🎯 Business Objective
To analyze chatbot conversations and:
- Improve intent recognition accuracy  
- Reduce fallback rates  
- Identify user drop-off points  
- Enhance overall chatbot performance and customer satisfaction  

---

## 📊 Dataset
The dataset contains structured chatbot interaction logs with the following fields:

- `conversation_id` – Unique conversation identifier  
- `timestamp` – Message timestamp  
- `user_query` – User input text  
- `intent` – Classified user intent  
- `bot_response` – Chatbot reply  
- `category` – Business category (Order, Payment, etc.)  
- `fallback` – Indicates failed response (1 = Yes, 0 = No)  
- `resolved` – Indicates successful resolution (1 = Yes, 0 = No)  
- `flags` – Additional classification metadata  

---

## 🛠️ Tools & Technologies
- **Python** – Data preprocessing & feature engineering  
- **MySQL** – Data analysis & KPI computation  
- **Power BI** – Dashboard creation & visualization  

---

## 📈 Key KPIs
- Total Conversations  
- Total Messages  
- Fallback Rate (%)  
- Resolution Rate (%)  
- Average Conversation Length  
- Intent-wise Performance  
- Category-wise Performance  

---

## ⚙️ Data Preparation
- Cleaned and structured chatbot logs  
- Created derived columns:
  - `fallback` to track failed interactions  
  - `resolved` to track successful outcomes  
- Generated conversation-level grouping for analysis  
- Added time-based features for trend analysis  

---

## 🔍 Key Analysis Performed

### 1. Conversation Metrics
- Total conversations and message volume  
- Average messages per conversation  

### 2. Intent Analysis
- Most frequent user intents  
- Intent-level fallback and resolution rates  
- Identification of high-failure intents  

### 3. Category Analysis
- Performance comparison across business categories  
- Identification of categories with higher failure rates  

### 4. Conversation Behavior
- Short conversations (potential drop-offs)  
- Long conversations (complex user issues)  
- Conversations with repeated failures  

### 5. Time-Based Insights
- Hourly conversation trends  
- Peak usage periods  

---

## 💡 Key Insights
- Certain high-volume intents show lower resolution rates, indicating opportunities for improving intent training  
- Order-related queries contribute the highest interaction volume  
- Short conversations indicate potential user drop-offs  
- Peak activity hours highlight demand patterns for chatbot usage  

---


### Dashboard Highlights:
- KPI Overview (Conversations, Fallback Rate, Resolution Rate)  
- Intent Performance Analysis  
- Category-wise Insights  
- Conversation Behavior & Drop-offs  

---

## 🚀 Business Impact
- Enables identification of chatbot weaknesses  
- Supports optimization of NLP models and intent training  
- Helps reduce fallback rates and improve resolution  
- Enhances customer experience through data-driven insights  


---

## 🔮 Future Enhancements
- Incorporate real-time chatbot logs  
- Add sentiment analysis on user queries  
- Implement machine learning for intent prediction  
- Enhance dashboard with drill-down capabilities  

---

## 👩‍💻 Author
Pooja Subramanyam
