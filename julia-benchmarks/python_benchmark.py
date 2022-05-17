from time       import perf_counter
from numpy      import array, zeros, mean, std
import pybind


N = int(1e4)
M = int(1e4)

def init():
    pybind.fn0()
    pybind.fn1(1)
    pybind.fn2(1, 2.0)
    pybind.fn3(1, 2.0, "hello")


def test_fn0():

    counters = zeros(N)

    for i in range(N):
        tic = perf_counter()
        for j in range(M):
            pybind.fn0()
        toc = perf_counter()
        counters[i] = (toc-tic)/M*1e9

    return mean(counters), std(counters), mean(counters)/std(counters)


def test_fn1():

    counters = zeros(N)

    for i in range(N):
        tic = perf_counter()
        for j in range(M):
            pybind.fn1(1)
        toc = perf_counter()
        counters[i] = (toc-tic)/M*1e9

    return mean(counters), std(counters), mean(counters)/std(counters)


def test_fn2():

    counters = zeros(N)

    for i in range(N):
        tic = perf_counter()
        for j in range(M):
            pybind.fn2(1, 2.0)
        toc = perf_counter()
        counters[i] = (toc-tic)/M*1e9

    return mean(counters), std(counters), mean(counters)/std(counters)


def test_fn3():

    counters = zeros(N)

    for i in range(N):
        tic = perf_counter()
        for j in range(M):
            pybind.fn3(1, 2.0, "hello")
        toc = perf_counter()
        counters[i] = (toc-tic)/M*1e9

    return mean(counters), std(counters), mean(counters)/std(counters)


if __name__ == "__main__":

    init()

    print(test_fn0())
    print(test_fn1())
    print(test_fn2())
    print(test_fn3())