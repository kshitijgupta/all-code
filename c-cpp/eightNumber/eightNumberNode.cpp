#include "eightNumber.h"

bool operator < (const EightNumberNode& e1, const EightNumberNode& e2)
{
    return (e1.cost > e2.cost);
}

bool operator > (const EightNumberNode& e1, const EightNumberNode& e2)
{
    return (e1.cost < e2.cost);
}
