//
//  Shader.fsh
//  openglGame
//
//  Created by Denny C. Dai on 9/18/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
