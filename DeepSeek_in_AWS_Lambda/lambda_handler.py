import os
import json
from deepseek import DeepSeek

def lambda_handler(event, context):
    try:
        # Explicitly use R1 base model
        model_to_use = "deepseek-r1" 

        # Initialize client with the specified model
        client = DeepSeek(api_key=os.environ["DEEPSEEK_API_KEY"])

        # Parse input (API Gateway or direct invocation)
        user_input = (
        json.loads(event["body"]).get("query") 
        if "body" in event 
        else event.get("query", "Hello!")
        )

        # Call DeepSeek API (optimized for shorter context)
        response = client.chat.completions.create(
        model=model_to_use,  
        messages=[
            {
                "role": "system", 
                "content": "You are a concise assistant. Keep responses under 100 words."
            },
            {
                "role": "user", 
                "content": user_input[:3000]  # R1 has 4K token limit
            }
        ],
        temperature=0.5,  # Balanced creativity/accuracy
        max_tokens=200    # Control costs (R1 is cheaper but less efficient)
        )

        return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({
            "response": response.choices[0].message.content,
            "model": model_to_use  # For debugging
        })
        }

    except Exception as e:
        print(f"R1 Model Error: {str(e)}")
        return {
            "statusCode": 500,
            "body": json.dumps({"error": "Processing failed"})
        }