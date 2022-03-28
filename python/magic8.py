# Import for random.randint
import random

# Variables
name = ""
question = ""
answer = ""

# Generate random number
random_number = random.randint(1, 9)
# Test print for random number
# print(random_number)

# if / elif for numbers and answers
if random_number == 1:
    answer = "Yes - definitely."
elif random_number == 2:
    answer = "I is decidedly so."
elif random_number == 3:
    answer = "Without a doubt."
elif random_number == 4:
    answer = "Reply hazy, try again."
elif random_number == 5:
    answer = "Ask again later."
elif random_number == 6:
    answer = "Better not tell you now."
elif random_number == 7:
    answer = "My sources say no."
elif random_number == 8:
    answer = "Outlook not so good."
elif random_number == 9:
    answer = "Very doubtful."
else:
    answer = "Error"

# Prints outputs
if name == "":
    print(question)
else:
    print(name + " asks: " + question)


if question == "":
    print("Have you learned it all?")
else:
    print("Magic 8-Ball's answer: " + answer)
