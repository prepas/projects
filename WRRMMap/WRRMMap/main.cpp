#include "stdafx.h"
#include "WRRMMap.h"
#include <iostream>
#include <wtypes.h>

int j = 0;
int threadNum = 0;
DWORD WINAPI ThreadFunc(LPVOID map)
{
    int nnn = ++threadNum;
    WRRMMap<int, int>* wRRMMap = (WRRMMap<int, int>*)map;
    int mx = j + 10;
    for (int i = j; i < mx; ++i)
    {
        std::cout << nnn << " " << i << std::endl;
        wRRMMap->Update(i, CAS(&j, j, j + i) * i);
    }

    return 0;
}

DWORD WINAPI ThreadFuncShow(LPVOID map)
{
    WRRMMap<int, int>* wRRMMap = (WRRMMap<int, int>*)map;

    for (int i = 1; i < j; ++i)
    {
        std::cout << wRRMMap->Lookup(i) << " ";
    }

    return 0;
}

int _tmain(int argc, _TCHAR* argv[])
{
    WRRMMap<int, int> wRRMMap;
    
    std::cout << std::endl;

    DWORD dwThreadId, dwThrdParam = 1;

    HANDLE hThreadPush1 = CreateThread(NULL, 0,    ThreadFunc, &wRRMMap, 0, &dwThreadId);
    HANDLE hThreadPush2 = CreateThread(NULL, 0,    ThreadFunc, &wRRMMap, 0, &dwThreadId);

    WaitForSingleObject(hThreadPush2, INFINITE);
    WaitForSingleObject(hThreadPush1, INFINITE);

    HANDLE hThreadShow = CreateThread(NULL, 0,    ThreadFuncShow, &wRRMMap, 0, &dwThreadId);

    WaitForSingleObject(hThreadShow, INFINITE);
    CloseHandle(hThreadShow);
    CloseHandle(hThreadPush2);
    CloseHandle(hThreadPush1);
    return 0;
}
