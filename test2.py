import random

def play_game():
    # Define possible choices
    choices = ["rock", "paper", "scissors"]

    # Ask the user for the number of rounds
    num_rounds = int(input("How many rounds would you like to play? "))

    # Initialize scores
    user_score = 0
    computer_score = 0

    for _ in range(num_rounds):
        # Let the user make a choice
        user_choice = input("Choose rock, paper, or scissors: ").lower()
        while user_choice not in choices:
            user_choice = input("Invalid choice. Please choose rock, paper, or scissors: ").lower()

        # Let the computer make a choice
        computer_choice = random.choice(choices)
        print(f"Computer chose {computer_choice}")

        # Determine the winner
        if user_choice == computer_choice:
            print("It's a tie!")
        elif (user_choice == "rock" and computer_choice == "scissors") or \
             (user_choice == "paper" and computer_choice == "rock") or \
             (user_choice == "scissors" and computer_choice == "paper"):
            print("You win this round!")
            user_score += 1
        else:
            print("You lose this round!")
            computer_score += 1

        print(f"Current Score: You {user_score} - {computer_score} Computer")
        print()

    # Final result after the specified number of rounds
    print("Game Over!")
    if user_score > computer_score:
        print(f"You won the game! Final Score: You {user_score} - {computer_score} Computer")
    elif user_score < computer_score:
        print(f"You lost the game! Final Score: You {user_score} - {computer_score} Computer")
    else:
        print(f"The game is a tie! Final Score: You {user_score} - {computer_score} Computer")

# Play the game
play_game()