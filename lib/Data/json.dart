final defaultdata = {
  "widget": "McqsQuestion",
  "props": {
    "question":
        "Welcome to Radhe Ankit's MCQS Generator App. This is the default MCQS. You can generate any mcqs you want. What is the capital city of France?",
    "choice1": "London",
    "choice2": "Berlin",
    "choice3": "Paris",
    "choice4": "Madrid",
    "correctOption": 3,
    "explaination": "Paris is the capital and most populous city of France.",
  },
};

final jsonData = {
  "widget": "Column",
  "props": {
    "children": [
      {
        "widget": "Container",
        "props": {
          "child": {
            "widget": "Column",
            "props": {
              "children": [
                {
                  "widget": "TextCard",
                  "props": {"text": "Welcome You Guys", "fontSize": 28},
                },

                {
                  "widget": "TextCard",
                  "props": {"text": "Explore My Generated UI", "fontSize": 18},
                },
              ],
            },
          },
        },
      },
      {
        "widget": "Row",
        "props": {
          "children": [
            {
              "widget": "ButtonCard",
              "props": {"title": "Login", "action": "login"},
            },

            {
              "widget": "ButtonCard",
              "props": {"title": "Signup", "action": "signup"},
            },
          ],
        },
      },
      {
        "widget": "TextCard",
        "props": {"text": "Featured Products", "fontSize": 24},
      },
      {
        "widget": "Column",
        "props": {
          "children": [
            {
              "widget": "ProductCard",
              "props": {
                "title": "iPhone 15",
                "price": 999,
                "image": "https://picsum.photos/200?1",
              },
            },

            {
              "widget": "ProductCard",
              "props": {
                "title": "MacBook Pro",
                "price": 1999,
                "image": "https://picsum.photos/200?2",
              },
            },

            {
              "widget": "ProductCard",
              "props": {
                "title": "AirPods",
                "price": 299,
                "image": "https://picsum.photos/200?3",
              },
            },
          ],
        },
      },
      {
        "widget": "TextCard",
        "props": {"text": "Top Creators", "fontSize": 24},
      },

      {
        "widget": "Column",
        "props": {
          "children": [
            {
              "widget": "ProfileCard",
              "props": {
                "name": "Radhe",
                "email": "radhe@gmail.com",
                "image": "https://picsum.photos/200?4",
              },
            },

            {
              "widget": "ProfileCard",
              "props": {
                "name": "Ankit",
                "email": "ankit@gmail.com",
                "image": "https://picsum.photos/200?5",
              },
            },
          ],
        },
      },
      {
        "widget": "ImageCard",
        "props": {"url": "https://picsum.photos/500/300", "height": 250},
      },
      {
        "widget": "Container",
        "props": {
          "child": {
            "widget": "Column",
            "props": {
              "children": [
                {
                  "widget": "TextCard",
                  "props": {"text": "Thank You For Visiting", "fontSize": 22},
                },

                {
                  "widget": "ButtonCard",
                  "props": {"title": "Contact Us", "action": "contact"},
                },
              ],
            },
          },
        },
      },
      {
        "widget": "ButtonCard",
        "props": {
          "title": "Login",
          "action": "login_user",
          "backgroundColor": "#2196F3",
          "textColor": "#FFFFFF",
          "width": 200,
          "height": 50,
          "disabled": false,
        },
      },

      {
        "widget": "McqsQuestion",
        "props": {
          "question": "What is the capital city of France?",
          "choice1": "London",
          "choice2": "Berlin",
          "choice3": "Paris",
          "choice4": "Madrid",
          "correctOption": 3,
          "explaination":
              "Paris is the capital and most populous city of France.",
        },
      },
    ],
  },
};
