# -*- coding: utf-8 -*-

# import numpy as np
import pandas as pd
import time
import psutil

# def read_titanic():
#     df = pd.read_csv("./dataset/train.csv")
#     return df

# def general_get_desc(path: "str") -> "pd.DataFrame":
#     return pd.read_csv(path).describe()


def main():
    # test = get_desc_stats()
    # print(test.loc["count", "PassengerId"])
    start_time = time.time()
    df = pd.read_csv("./dataset/train.csv")
    print(f"Mean of Survived column (survival rate) is: {df["Survived"].mean()}")
    end_time = time.time()
    print(f"Time used: {end_time - time: /4f} seconds")
    print(f"CPU usage: {psutil.cpu_percent()}")
    print(f"CPU usage: {psutil.virtual_memory()}")
    return 0


if __name__ == "__main__":
    main()
