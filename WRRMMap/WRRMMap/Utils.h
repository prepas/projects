#pragma once

template <class T>
bool CAS(T* addr, T exp, T val)
{
    if (*addr == exp)
    {
        *addr = val;
        return true;
    }
    return false;
}