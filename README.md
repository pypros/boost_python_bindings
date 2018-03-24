# boost_python_bindings

### Setup env
```
docker-compose up -d
```
Log on to container
```
docker-compose exec cython_binding sh
```

### Boost bindings

1. Creat symboli link to python3. Deflaut boost python creat only -lboost_python which is library to python2. 
```
ln -s /usr/lib/x86_64-linux-gnu/libboost_python-py36.so /usr/lib/x86_64-linux-gnu/libboost_python3.so
```
2. Go to root folder project and do all steps:

3. Build Rectangle.o - object file
```
g++ -o build/Rectangle.o -c cpp_code/library_rectangle/src/Rectangle.cpp -Wall -fPIC -I/usr/include/python3.6 -Icpp_code/library_rectangle/inc/
```
4. Build Square.o - object file
```
g++ -o build/Square.o -c cpp_code/library_square/src/Square.cpp -Wall -fPIC -I/usr/include/python3.6 -Icpp_code/library_square/inc/
```
5. Build Square.o - object file
```
g++ -o build/Shapes.o -c boost_bindings/Shapes.cpp -Wall -fPIC -I/usr/include/python3.6 -Icpp_code/library_rectangle/inc/ -Icpp_code/library_square/inc/
```
6. Build shapes.so - shared object library - which will be import to python
```
g++ -shared -o shapes.so build/Rectangle.o  build/Shapes.o  build/Square.o -L/usr/local/lib -lpython3.6m -lboost_python3 -lboost_system
```
7. in root folder run python3
8. from shapes import Rectangle, Square
