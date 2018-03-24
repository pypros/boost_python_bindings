namespace shapes {
    class Square {
    public:
        int x0, y0, x1, y1;
        Square();
        Square(int x0, int y0, int x1, int y1);
        ~Square();
        int getArea();
        void getSize(int* width, int* height);
        void move(int dx, int dy);
    };
}
