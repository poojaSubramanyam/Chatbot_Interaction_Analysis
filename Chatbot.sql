CREATE TABLE chatbot (
    flags VARCHAR(10),
    user_query TEXT,
    category VARCHAR(50),
    intent VARCHAR(50),
    bot_response TEXT,
    fallback TINYINT,
    resolved TINYINT,
    conversation_id INT,
    timestamp DATETIME
);

TRUNCATE TABLE chatbot_analytics.chatbot;

LOAD DATA LOCAL INFILE '/Users/poojasubramanyam/Downloads/Chatbot_Analytics/chatbot_logs.csv'
INTO TABLE chatbot_analytics.chatbot
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


ALTER TABLE chatbot
MODIFY conversation_id INT FIRST,
MODIFY timestamp DATETIME AFTER conversation_id,
MODIFY user_query TEXT AFTER timestamp,
MODIFY intent VARCHAR(50) AFTER user_query,
MODIFY bot_response TEXT AFTER intent,
MODIFY category VARCHAR(50) AFTER bot_response,
MODIFY fallback TINYINT AFTER category,
MODIFY resolved TINYINT AFTER fallback,
MODIFY flags VARCHAR(10) AFTER resolved;

-- Total Conversations
SELECT COUNT(DISTINCT(conversation_id)) AS total_conversations
FROM chatbot;

-- Total Messages
SELECT COUNT(*) AS total_messages
FROM chatbot;

-- Fallback Rate
SELECT ROUND(SUM(fallback)*100.0/COUNT(*),2) AS fallback_rate
FROM chatbot;

-- Resolution Rate
SELECT 
ROUND(SUM(resolved)*100.0/COUNT(*),2) AS resolution_rate
FROM chatbot;

SELECT * FROM chatbot;

-- Avg Messages per Conversation
SELECT AVG(msg_count) AS avg_response
FROM (
	SELECT conversation_id, COUNT(*) AS msg_count
	FROM chatbot
	GROUP BY conversation_id
)t;

-- Conversations by Category
SELECT category, COUNT(*) AS category_count
FROM chatbot
GROUP BY category
ORDER BY category_count DESC;

-- Category-wise Fallback Rate
SELECT category,
ROUND(SUM(fallback)*100.0/COUNT(*),2) AS fallback_rate
FROM chatbot
GROUP BY category
ORDER BY fallback_rate DESC;

-- Category-wise Resolution Rate
SELECT category,
ROUND(SUM(resolved)*100.0/COUNT(*),2) AS resolution_rate
FROM chatbot
GROUP BY category
ORDER BY resolution_rate DESC;

-- Top Intents
SELECT intent, COUNT(*) AS total_count
FROM chatbot
GROUP BY intent
ORDER BY total_count DESC
LIMIT 10;

-- Intent Failure Analysis
SELECT intent, COUNT(*) AS total, SUM(fallback) AS failures,
	ROUND(SUM(fallback)*100.0/COUNT(*),2) AS failure_rate
FROM chatbot
GROUP BY intent
ORDER BY failure_rate DESC;

-- High Impact Intents (High Volume + High Failure)
SELECT intent, COUNT(*) AS total, SUM(fallback) AS failures
FROM chatbot
GROUP BY intent
HAVING COUNT(*) > 100
ORDER BY failures DESC;


-- Short Conversations (Drop-offs)
SELECT conversation_id, COUNT(*) AS steps
FROM chatbot
GROUP BY conversation_id
HAVING COUNT(*) <= 2
ORDER BY steps;


-- Long Conversations (Complex Issues)
SELECT conversation_id, COUNT(*) AS steps
FROM chatbot
GROUP BY conversation_id
ORDER BY steps DESC
LIMIT 10;


-- Conversations with Failures
SELECT conversation_id, COUNT(*) AS fallback_count
FROM chatbot
WHERE fallback = 1
GROUP BY conversation_id
ORDER BY fallback_count DESC;


-- Hourly Traffic
SELECT 
HOUR(timestamp) AS hour,
COUNT(DISTINCT conversation_id) AS conversations
FROM chatbot
GROUP BY hour
ORDER BY hour;


-- Peak Load (Messages)
SELECT HOUR(timestamp) AS hour, COUNT(*) AS messages
FROM chatbot
GROUP BY hour
ORDER BY messages DESC;


-- Messages by Flag
SELECT flags, COUNT(*) AS total
FROM chatbot
GROUP BY flags;


-- Flag vs Fallback
SELECT flags, ROUND(SUM(fallback)*100.0/COUNT(*),2) AS fallback_rate
FROM chatbot
GROUP BY flags;


-- Which category needs improvement?
SELECT category, SUM(fallback) AS failures, COUNT(*) AS total, 
	ROUND(SUM(fallback)*100.0/COUNT(*),2) AS failure_rate
FROM chatbot
GROUP BY category
ORDER BY failure_rate DESC;


-- Most problematic user queries
SELECT user_query, COUNT(*) AS occurrences
FROM chatbot
WHERE fallback = 1
GROUP BY user_query
ORDER BY occurrences DESC
LIMIT 10;


-- Best performing intents
SELECT intent,
ROUND(SUM(resolved)*100.0/COUNT(*),2) AS resolution_rate
FROM chatbot
GROUP BY intent
ORDER BY resolution_rate DESC;









