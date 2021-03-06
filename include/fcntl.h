/*  This file is part of The Firekylin Operating System.
 *
 *  Copyright 2016 Liuxiaofeng
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#ifndef _FCNTL_H
#define _FCNTL_H

//#pragma  message("<fcntl.h> Deprecated, use <sys/fcntl.h> instead")
//#pragma  message("O_RDONLY Deprecated, use O_READ instead")
//#pragma  message("O_WRONLY Deprecated, use O_WRITE instead")

#include <sys/fcntl.h>

#define O_RDONLY	O_READ
#define O_WRONLY	O_WRITE

#endif
