def reverse(text):
    # comprehension
    length = len(text)
    return "".join([text[x] for x in range(len(text) - 1, -1, -1)])
    # trickery
    return text[::-1]
    # via list reverse
    list_text = list(text)
    list_text.reverse()
    return "".join(list_text)
