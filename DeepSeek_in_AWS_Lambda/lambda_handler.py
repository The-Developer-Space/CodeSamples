import os
import json
from deepseek import DeepSeek

def lambda_handler(event, context):
    try:
        # Initialize client (uses env var)
        client = DeepSeek(api_key=os.environ["DEEPSEEK_API_KEY"])
        
        # Parse input from API Gateway/EventBridge
        user_input = json.loads(event["body"]).get("query") if "body" in event else event.get("query", "Hello!")
        
        # Call DeepSeek API
        response = client.chat.completions.create(
            model="deepseek-chat",
            messages=[
                {"role": "system", "content": "You are a concise AI assistant."},
                {"role": "user", "content": user_input}
            ],
            max_tokens=150  # Control costs
        )
        
        return {
            "statusCode": 200,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps({"response": response.choices[0].message.content})
        }
        
    except Exception as e:
        print(f"ERROR: {str(e)}")
        return {"statusCode": 500, "body": "AI service unavailable"}