import praw
import pandas as pd

reddit_read_only = praw.Reddit(client_id="K1bJ8sPZLLJxe5pgdgk-Tg",		 # your client id
							client_secret="CNmfO3Kg3a1z9P2DmrkM5bp7eEfkQQ",	 # your client secret
							user_agent="Red_Bot")	 # your user agent


subreddit = reddit_read_only.subreddit("wallstreetbets")

# Display the name of the Subreddit
#print("Display Name:", subreddit.display_name)

# Display the title of the Subreddit
#print("Title:", subreddit.title)

# Display the description of the Subreddit
#print("Description:", subreddit.description)

# Display top 5 posts on the Subreddit
# for post in subreddit.hot(limit=5):
#     print(post.title)
#     print()

# posts = subreddit.top("month")
# # Scraping the top posts of the current month

# posts_dict = {"Title": [], "Post Text": [],
# 			"ID": [], "Score": [],
# 			"Total Comments": [], "Post URL": []
# 			}

# for post in posts:
# 	# Title of each post
# 	posts_dict["Title"].append(post.title)
	
# 	# Text inside a post
# 	posts_dict["Post Text"].append(post.selftext)
	
# 	# Unique ID of each post
# 	posts_dict["ID"].append(post.id)
	
# 	# The score of a post
# 	posts_dict["Score"].append(post.score)
	
# 	# Total number of comments inside the post
# 	posts_dict["Total Comments"].append(post.num_comments)
	
# 	# URL of each post
# 	posts_dict["Post URL"].append(post.url)

# # Saving the data in a pandas dataframe
# top_posts = pd.DataFrame(posts_dict)
# top_posts

# # Saving data to .csv
# top_posts.to_csv("Top Posts.csv", index=True)

# URL of the post
# url = "https://www.reddit.com/r/wallstreetbets/comments/1fcysma/what_are_your_moves_tomorrow_september_10_2024/"
 
# # Creating a submission object
# submission = reddit_read_only.submission(url=url)

# from praw.models import MoreComments

# post_comments = []

# for comment in submission.comments:
# 	if type(comment) == MoreComments:
# 		continue

# 	post_comments.append(comment.body)

# # creating a dataframe
# comments_df = pd.DataFrame(post_comments, columns=['comment'])
# comments_df
