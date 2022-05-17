CXX      := g++
CXXSTD   := -std=c++14
CXXFLAGS := $(CXXSTD) -O3 -fPIC -I.
LDFLAGS  := -lcuda
PYVER    := $(shell                                                        \
    python -c "import sys; print('{}.{}'.format(*sys.version_info[0:2]))"  \
)
INCLUDES := $(shell python -m pybind11 --includes) -Iinclude
PYSUFFIX := $(shell python$(PYVER)-config --extension-suffix)

%.o: %.cpp
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) $< -o $@

%$(PYSUFFIX): %.o
	$(CXX) -shared $(CXXFLAGS) $^ -o $@

%.so: %.o
	$(CXX) -shared $(CXXFLAGS) $^ -o $@

all: pybind$(PYSUFFIX) libbenchmark.so

clean:
	rm pybind$(PYSUFFIX)