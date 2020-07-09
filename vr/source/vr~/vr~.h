//
//  vr~.h
//  vr~
//
//  Created by Graham Wakefield on 2017-11-24.
//
//

#ifndef vr__h
#define vr__h

// see https://cycling74.com/forums/topic/error-126-loading-external/#.WIvJXhsrKHs
#define MAXAPI_USE_MSCRT

// a bunch of likely Max includes:
extern "C" {
#include "ext.h"
#include "ext_obex.h"
#include "ext_dictionary.h"
#include "ext_dictobj.h"
#include "ext_systhread.h"
	
#include "z_dsp.h"
	
#include "jit.common.h"
#include "jit.vecmath.h"
#include "jit.gl.h"
#include "max.jit.mop.h"
}

#include "al_math.h"

#include "steamaudio_api/include/phonon.h"

#include <new> // for in-place constructor
#include <vector>



#endif /* vr__h */
