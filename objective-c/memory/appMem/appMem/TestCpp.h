//
//  TestCpp.h
//  appMem
//
//  Created by Denny C. Dai on 8/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#ifndef __appMem__TestCpp__
#define __appMem__TestCpp__

#include <iostream>

/**
 You cannot use object pointers in C structures. / but can do it in a struct within a C++ compilation unit
 Rather than using a struct, you can create an Objective-C class to manage the data instead.
 **/
struct TestStruct{
    id _obj;
};


//but u can do it in cpp class
class TestCppObject {
private:
    id m_obj;
};


#endif /* defined(__appMem__TestCpp__) */
