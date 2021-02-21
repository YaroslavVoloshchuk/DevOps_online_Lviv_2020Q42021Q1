vowels = 'aeiou'


def count_vowels(string, vowels):
    # casefold() it is how lower() , but stronger
    string = string.casefold()

    # Forms a dictionary with key as a vowel
    count = {}.fromkeys(vowels, 0)

    # To count the vowels
    for character in string:
        if character in count:
            count[character] += 1
    return count


string = 'YaroslavVoloshchukISdevops'
print(count_vowels(string, vowels))