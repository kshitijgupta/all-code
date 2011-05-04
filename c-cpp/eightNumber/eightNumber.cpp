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

#include "eightNumber.h"
#include <stdlib.h>
#include <time.h>
#include <iostream>
#include <algorithm>

using namespace std;

EightNumber::EightNumber()
{
    int init[9] = {0, 1, 2, 3, 4, 5, 6, 7, 8};
    //srandom((int)time(0));
/*    for (int i=0; i<9; i++)
    {
        int rIndex = (int) (1.0* (8-i) * rand()/RAND_MAX);
        states[i] = init[rIndex];
        swap(init[rIndex], init[8-i]);
    }
*/
 
    states[0] = 7;
    states[1] = 2;
    states[2] = 4;
    states[3] = 5;
    states[4] = 0;
    states[5] = 6;
    states[6] = 8;
    states[7] = 3;
    states[8] = 1;

    LevelState ls(0, states);
    lsvec.push_back(ls);
    
    tree_header = new EightNumberNode;
    tree_header->lsIndex = 0;

    say(*tree_header);
    cout << "目标状态： 0 1 2 3 4 5 6 7 8" << endl;

    priority_leaves.push(*tree_header);
}

void EightNumber::clean(EightNumberNode& son, EightNumberNode& father)
{
    vector<EightNumberNode*> kids = son.children;
    if (kids.size() == 0)
    {
        if (&son != &father)// for tree_head
        {
            vector<EightNumberNode*>::iterator iter;
            iter = find(father.children.begin(), father.children.end(), &son);
            father.children.erase(iter);
        }
        delete &son;
    }
    else
    {
        for (int i=0; i<kids.size(); i++)
        {
            clean(*kids[i], son);
        }
    }
}

EightNumber::~EightNumber()
{
    clean(*tree_header, *tree_header);
}

void EightNumber::expand(EightNumberNode& e)
{
    int* zeroptr = find(lsvec[e.lsIndex].states, lsvec[e.lsIndex].states+9, 0);
    int zero_index = zeroptr - lsvec[e.lsIndex].states;

    int left  = zero_index - 1;
    int right = zero_index + 1;
    int up    = zero_index - 3;
    int down  = zero_index + 3;

    if ((left >= 0) && (zero_index % 3 != 0))// left is available
    {
        cout << "expand left node" << endl;

        EightNumberNode* ptr = build_child(e, zero_index, left);
        if (!is_seen(*ptr))
        {
            priority_leaves.push(*ptr);
        }
    }
    if ((right < 9) && ((zero_index+1) % 3 != 0))
    {
        cout << "expand right node" << endl;
        EightNumberNode* ptr = build_child(e, zero_index, right);

        if (!is_seen(*ptr))
        {
            priority_leaves.push(*ptr);
        }
    }
    if ((up >= 0) && (zero_index >= 3))
    {
        cout << "expand up node" << endl;
        EightNumberNode* ptr = build_child(e, zero_index, up);
        if (!is_seen(*ptr))
        {
            priority_leaves.push(*ptr);
        }
    }
    if (down < 9)
    {
        cout << "expand down node" << endl;
        EightNumberNode* ptr = build_child(e, zero_index, down);
        if (!is_seen(*ptr))
        {
            priority_leaves.push(*ptr);
        }
    }
}
void EightNumber::say(EightNumberNode& e)
{
    cout << "当前状态: ";
    for (int i=0; i<9; i++)
    {
        cout << lsvec[e.lsIndex].states[i] << " ";
    }
    cout << endl;
}

int EightNumber::f(EightNumberNode& e)
{
    return lsvec[e.lsIndex].level;
}
int EightNumber::h(EightNumberNode& e)
{
    int * cur = lsvec[e.lsIndex].states;
    int res = 0;
    for (int i=0; i<9; i++)
    {
        if (cur[i] != i)
            res++;
    }
    return res;
}
int EightNumber::g(EightNumberNode& e)
{
    int fcost = f(e);
    int hcost = h(e);
    //cout << "cost " << fcost << " " << hcost << endl;
    return fcost + hcost;
}

EightNumberNode EightNumber::get_header()
{
    return *tree_header;
}

EightNumberNode* EightNumber::build_child(EightNumberNode& e, int zero_index, int change_index)
{
    LevelState lsfather = lsvec.at(e.lsIndex);

    LevelState ls;
    ls.level = lsfather.level + 1;
    memcpy(ls.states, lsfather.states, sizeof(int)*9);
    swap(ls.states[change_index], ls.states[zero_index]);

    lsvec.push_back(ls);

    EightNumberNode* node_ptr = new EightNumberNode;
    node_ptr->lsIndex = lsvec.size()-1;
    node_ptr->cost = g(*node_ptr);

    e.children.push_back(node_ptr);

    cout << "cost is " << node_ptr->cost << endl;;
    say(*node_ptr);

    return node_ptr;
}

bool EightNumber::is_success(EightNumberNode&e)
{
    return h(e) == 0?true:false;
}

EightNumberNode EightNumber::get_next_node()
{
    if (priority_leaves.size() != 0)
    {
        EightNumberNode e = priority_leaves.top();
        priority_leaves.pop();
        cout << "get_node level " << lsvec[e.lsIndex].level << endl;
        return e;
    }
    else
    {
        EightNumberNode e;
        e.cost = -1;
        return e;
    }
}

bool EightNumber::is_seen(EightNumberNode& e)
{
    using namespace __gnu_cxx;
    unsigned long hash = hash_EightNumberNode(e);
    hash_set<unsigned long>::iterator iter = seen_set.find(hash);
    if (iter == seen_set.end())
    {
        seen_set.insert(hash);
        return false;
    }
    return true;
}

unsigned long EightNumber::hash_EightNumberNode(EightNumberNode& e)
{
    unsigned long sll = 0;
    for (int i=0; i<9; i++)
    {
        sll = sll*10 + lsvec[e.lsIndex].states[i];
    }
    return sll;
}

