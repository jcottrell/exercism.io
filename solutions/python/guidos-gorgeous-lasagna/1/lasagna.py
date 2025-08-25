"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language: https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

import lasagna

# TODO: define the 'EXPECTED_BAKE_TIME' constant
# TODO: consider defining the 'PREPARATION_TIME' constant
#       equal to the time it takes to prepare a single layer

lasagna.EXPECTED_BAKE_TIME=40
lasagna.PREPARATION_TIME=2

# TODO: define the 'bake_time_remaining()' function
def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


# TODO: define the 'preparation_time_in_minutes()' function
#       and consider using 'PREPARATION_TIME' here
def preparation_time_in_minutes(number_of_layers):
    """Calculate the preparation time given the number of layers.

    :param number_of_layers
    :return: int - total number of minutes needed to prepare

    Function that takes the number of layers for a lasagna and
    calculates the total preparation time for the lasagna.
    """
    return number_of_layers * lasagna.PREPARATION_TIME

# TODO: define the 'elapsed_time_in_minutes()' function
def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """Calculate the number of minutes already elapsed making lasagna

    :param number_of_layers
    :param elapsed_bake_time
    :return int - total time passed since lasagna was started

    Function that takes layers and time in oven and gives
    time taken to make lasagna so far.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
