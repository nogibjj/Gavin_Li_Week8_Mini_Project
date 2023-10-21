# -*- coding: utf-8 -*-

# import numpy as np
import pandas as pd

def read_titanic():
    df = pd.read_csv("./dataset/train.csv")
    return df

def general_get_desc(path: "str") -> "pd.DataFrame":
    return pd.read_csv(path).describe()


def main():
    # test = get_desc_stats()
    # print(test.loc["count", "PassengerId"])
    pass

if __name__ == "__main__":
    main()
