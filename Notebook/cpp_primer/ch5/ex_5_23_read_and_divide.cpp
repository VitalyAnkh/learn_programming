#include <iostream>
int main()
{
    int a, b;
    std::cout << "请输入两个数字： " << std::endl;
    std::cin >> a >> b;
    int q = a / b;
    std::cout << "第一个数字除以第二个数字的商是： " << q << std::endl;
    return 0;
}