#   Import the json Mod
import json

# Array of JSON Objects

musics = [
    {"title": "Death Bed", "artist": "Powerfu", "id": 1},
    {"title": "Bad Liar", "artist": "Imagine Dragons", "id": 2},
    {"title": "Thunder", "artist": "Imagine Dragons", "id": 5},
    {"title": "Faded", "artist": "Alan Walker", "id": 10},
    {"title": "Darkside", "artist": "Alan Walker", "id": 10},
]

# Read and print the original data
print("The original data:\n{0}".format(musics))
# Convert into the JSON object after sorting

sorted_json_data = json.dumps(musics, sort_keys=True)
# Print the sorted Json data
print("The sorted JSON data based on the keys:\n{0}".format(sorted_json_data))
