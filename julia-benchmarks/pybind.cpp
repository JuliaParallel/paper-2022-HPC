#include <pybind11/pybind11.h>


namespace py = pybind11;


PYBIND11_MODULE(pybind, m) {

    m.def(
        "fn0",
        []() {
            return 1;
        }
    );

    m.def(
        "fn1",
        [](int x) {
            return x;
        }
    );

    m.def(
        "fn2",
        [](int x, double y) {
            return y;
        }
    );


    m.def(
        "fn3",
        [](int x, double y, const std::string & s) {
            return s;
        }
    );


    m.attr("major_version")   = py::int_(0);
    m.attr("minor_version")   = py::int_(1);
    m.attr("release_version") = py::int_(0);
}