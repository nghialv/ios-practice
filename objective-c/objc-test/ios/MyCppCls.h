//
//  MyCppCls.h
//  objc-test
//
//  Created by Denny C. Dai on 8/12/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#ifndef __objc_test__MyCppCls__
#define __objc_test__MyCppCls__

#include <iostream>

typedef struct {
    //unsafe/unretained reference to an objective c object
    //which doesn't participate in ARC 
    __unsafe_unretained id objc;
}TestCppStruct;


class MyCppCls {
public:
    MyCppCls(id orign);
    
private:
    id __weak m_id; //avoid strong reference that creates a retain cycle with an objective c object
};

#endif /* defined(__objc_test__MyCppCls__) */
