# -*- coding: utf-8 -*-

from main import read_titanic#, general_get_desc
import matplotlib.pyplot as plt

def test_get_desc_stats():
    # print(longestSubstring("abcdcca"))
    assert read_titanic()\
        .describe(include="all").\
        loc["count", "PassengerId"] == 891
    assert round(read_titanic().\
        describe(include="all").\
        loc["mean", "Survived"], 4) == 0.3838


if __name__ == "__main__":
    test_get_desc_stats()
    ## TODO generate summary statistics
    df = read_titanic()
    print(
        "Below are some summary statistics of variable `Survived` in the Titanic dataset"
    )
    smm = df.describe(include="all")
    di = {
        "mean"                  :   smm.loc["mean", "Survived"],
        "median"                :   df["Survived"].median(),
        "standard deviation"    :   smm.loc["std", "Survived"],
        "maximum"               :   smm.loc["max", "Survived"],
        "minimum"               :   smm.loc["min", "Survived"]}
    for k, v in di.items():
        print(f"{k} : {v}")

    ## TODO one visualization
    print("Below is a histogram of variable `Survived` in the Titanic dataset")
    plt.hist(df["Survived"])
    plt.title("Histogram of Survived")
    plt.xlabel("Survived")
    plt.ylabel("Count")
    plt.show()
