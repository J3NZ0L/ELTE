# Open the file
with open('unicef.txt', 'r') as file:
    # Read all lines from the file
    lines = file.readlines()

    # Split each line into a list of strings
    data = [line.strip().split('|') for line in lines]

