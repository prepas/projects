#pragma once
#include <map>
#include "Utils.h"

template <class K, class V>
class WRRMMap
{
    std::map<K, V>* pMap_;
public:
    WRRMMap()
    {
        pMap_ = new std::map<K, V>();
    }
    V Lookup(const K& k)
    {
        // Look, ma, no lock
        return (*pMap_)[k];
    }
    void Update(const K& k, const V& v)
    {
        std::map<K, V>* pNew = 0;
        std::map<K, V>* pOld = 0;
        do
        {
            pOld = pMap_;
            delete pNew;
            pNew = new std::map<K, V>(*pOld);
            pNew->insert(std::make_pair(k, v));
        } while (!CAS(&pMap_, pOld, pNew));
        // DON’T delete pMap_;
    }
};