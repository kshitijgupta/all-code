/*
 * 把对象直接存入容器中有时会有些麻烦。以值的方式保存对象意味着使用者将获得容器中的元素的拷贝，
 * 对于那些复制是一种昂贵的操作的类型来说可能会有性能的问题。此外，有些容器，特别是 std::vector,
 * 当你加入元素时可能会复制所有元素，这更加重了性能的问题。最后，传值的语义意味着没有多态的行为。
 * 如果你需要在容器中存放多态的对象而且你不想切割它们，你必须用指针。如果你用裸指针，
 * 维护元素的完整性会非常复杂。从容器中删除元素时，你必须知道容器的使用者是否还在引用那些要删除的元素，
 * 不用担心多个使用者使用同一个元素。这些问题都可以用shared_ptr来解决。
 */



#include "boost/shared_ptr.hpp"
#include <vector>
#include <iostream>

class A {
    public:
        virtual void sing()=0;
    protected:
        virtual ~A() {};
};

class B : public A {
    public:
        virtual void sing() {
            std::cout << "Do re mi fa so la";
        }
};

boost::shared_ptr<A> createA() {
    boost::shared_ptr<A> p(new B());
    return p;
}

int main() {
    typedef std::vector<boost::shared_ptr<A> > container_type;
    typedef container_type::iterator iterator;

    container_type container;
    for (int i=0;i<10;++i) {
        container.push_back(createA());
    }

    std::cout << "The choir is gathered: \n";
    iterator end=container.end();
    for (iterator it=container.begin();it!=end;++it) {
        (*it)->sing();
        std::cout << std::endl;
    }
}
