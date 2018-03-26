#include <boost/python.hpp>
#include "Rectangle.h"
#include "Square.h"

using namespace boost::python;
using namespace shapes;


BOOST_PYTHON_MODULE(shapes)
{
    class_<Rectangle>("Rectangle", init<>())
        .def(init<int, int, int, int>())
        .def_readwrite("x0", &Rectangle::x0)
        .def_readwrite("x1", &Rectangle::x1)
        .def_readwrite("y0", &Rectangle::y0)
        .def_readwrite("y1", &Rectangle::y1)
        .def("getArea", &Rectangle::getArea)
        .def("getSize", &Rectangle::getSize)
        .def("move", &Rectangle::move)
    ;

    class_<Square>("Square", init<>())
        .def(init<int, int, int, int>())
        .def_readwrite("x0", &Square::x0)
        .def_readwrite("x1", &Square::x1)
        .def_readwrite("y0", &Square::y0)
        .def_readwrite("y1", &Square::y1)
        .def("getArea", &Square::getArea)
        .def("getSize", &Square::getSize)
        .def("move", &Square::move)
    ;


};
