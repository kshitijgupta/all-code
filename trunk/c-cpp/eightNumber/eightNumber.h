/* 
 *遵循知识共享（CC By2.5）协议详见
 *http://creativecommons.org/licenses/by/2.5/cn/
 */
/**
 * @file eightNumber.h
 * @Synopsis  用A*算法解决八数码问题
 * @author 罗磊, luoleicn@gmail.com
 * @version 
 * @date 2011-05-03
 */
#ifndef _EIGHTNUMBER_H
#define _EIGHTNUMBER_H

#include <vector>
#include <string.h>
#include <iostream>
#include <queue>
#include <ext/hash_set>
#include <bitset>

using  namespace std;

typedef struct LevelState
{
    int level;
    int states[9];

    LevelState()
    {
        level = 0;
    }
    LevelState(int l, int* s)
    {
        level = l;
        memcpy(states, s, sizeof(int)*9);
    }
}LevelState;

typedef struct EightNumberNode
{
    int cost;
    int lsIndex;
    std::vector<struct EightNumberNode*> children;

    friend bool operator < (const EightNumberNode&,const EightNumberNode&);
    friend bool operator > (const EightNumberNode&,const EightNumberNode&);
}EightNumberNode;

class EightNumber
{
    private:
        __gnu_cxx::hash_set<unsigned long> seen_set;
        int states[9];
        EightNumberNode* tree_header;

        std::vector<LevelState> lsvec;
        std::priority_queue<EightNumberNode> priority_leaves;

        EightNumberNode* build_child(EightNumberNode&,int,int);

        bool is_seen(EightNumberNode&);
        unsigned long hash_EightNumberNode(EightNumberNode&);

        int f(EightNumberNode&);//实际距离
        int h(EightNumberNode&);//启发距离
        int g(EightNumberNode&);//f() + h()

        void clean(EightNumberNode&, EightNumberNode&);
    public:
        EightNumber();
        ~EightNumber();
        void say(EightNumberNode&);//报告当前状态
        void expand(EightNumberNode&);
        EightNumberNode get_header();
        bool is_success(EightNumberNode&e);
        EightNumberNode get_next_node();
};
#endif//_EIGHTNUMBER_H
