// qlist.sip generated by MetaSIP
//
// This file is part of the QtCore Python extension module.
//
// Copyright (c) 2016 Riverbank Computing Limited <info@riverbankcomputing.com>
// 
// This file is part of PyQt4.
// 
// This file may be used under the terms of the GNU General Public License
// version 3.0 as published by the Free Software Foundation and appearing in
// the file LICENSE included in the packaging of this file.  Please review the
// following information to ensure the GNU General Public License version 3.0
// requirements will be met: http://www.gnu.org/copyleft/gpl.html.
// 
// If you do not wish to use this file under the terms of the GPL version 3.0
// then you may purchase a commercial license.  For more information contact
// info@riverbankcomputing.com.
// 
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.


// QList<TYPE> is implemented as a Python list.
template<TYPE>
%MappedType QList<TYPE> /TypeHintIn="Sequence[TYPE]", TypeHintOut="List[TYPE]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        TYPE *t = new TYPE(sipCpp->at(i));
        PyObject *tobj;

        if ((tobj = sipConvertFromNewType(t, sipType_TYPE, sipTransferObj)) == NULL)
        {
            Py_DECREF(l);
            delete t;

            return NULL;
        }

        PyList_SET_ITEM(l, i, tobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *itm = PySequence_ITEM(sipPy, i);
            bool ok = (itm && sipCanConvertToType(itm, sipType_TYPE, SIP_NOT_NONE));

            Py_XDECREF(itm);

            if (!ok)
                return 0;
        }

        return 1;
    }

    QList<TYPE> *ql = new QList<TYPE>;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *itm = PySequence_ITEM(sipPy, i);
        int state;
        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToType(itm, sipType_TYPE, sipTransferObj, SIP_NOT_NONE, &state, sipIsErr));

        Py_DECREF(itm);
 
        if (*sipIsErr)
        {
            sipReleaseType(t, sipType_TYPE, state);

            delete ql;
            return 0;
        }

        ql->append(*t);

        sipReleaseType(t, sipType_TYPE, state);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
// QList<TYPE *> is implemented as a Python list.
template<TYPE>
%MappedType QList<TYPE *> /TypeHintIn="Sequence[TYPE]", TypeHintOut="List[TYPE]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        TYPE *t = sipCpp->at(i);
        PyObject *tobj;

        // The explicit (void *) cast allows TYPE to be const.
        if ((tobj = sipConvertFromType((void *)t, sipType_TYPE, sipTransferObj)) == NULL)
        {
            Py_DECREF(l);
            return NULL;
        }

        PyList_SET_ITEM(l, i, tobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *itm = PySequence_ITEM(sipPy, i);
            bool ok = (itm && sipCanConvertToType(itm, sipType_TYPE, 0));

            Py_XDECREF(itm);

            if (!ok)
                return 0;
        }

        return 1;
    }

    QList<TYPE *> *ql = new QList<TYPE *>;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *itm = PySequence_ITEM(sipPy, i);
        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToType(itm, sipType_TYPE, sipTransferObj, 0, 0, sipIsErr));

        Py_DECREF(itm);
 
        if (*sipIsErr)
        {
            delete ql;
            return 0;
        }

        ql->append(t);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
// QList<QPair<TYPE1, TYPE2> > is implemented as a Python list of 2-element tuples.
template<TYPE1, TYPE2>
%MappedType QList<QPair<TYPE1, TYPE2> > /TypeHintIn="Sequence[Tuple[TYPE1, TYPE2]]", TypeHintOut="List[Tuple[TYPE1, TYPE2]]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
#include <qpair.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        const QPair<TYPE1, TYPE2> &p = sipCpp->at(i);
        TYPE1 *s1 = new TYPE1(p.first);
        TYPE2 *s2 = new TYPE2(p.second);
        PyObject *pobj;

        if ((pobj = sipBuildResult(NULL, "(NN)", s1, sipType_TYPE1, sipTransferObj, s2, sipType_TYPE2, sipTransferObj)) == NULL)
        {
            Py_DECREF(l);
            delete s1;
            delete s2;

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *seq = PySequence_ITEM(sipPy, i);

            if (!seq || !PySequence_Check(seq) || PySequence_Size(seq) != 2)
            {
                Py_XDECREF(seq);
                return 0;
            }

            PyObject *itm0 = PySequence_ITEM(seq, 0);
            PyObject *itm1 = PySequence_ITEM(seq, 1);

            if (!itm0 || !itm1)
            {
                Py_XDECREF(itm0);
                Py_XDECREF(itm1);
                Py_DECREF(seq);
                return 0;
            }

            if (!sipCanConvertToType(itm0, sipType_TYPE1, SIP_NOT_NONE) ||
                !sipCanConvertToType(itm1, sipType_TYPE2, SIP_NOT_NONE))
            {
                Py_DECREF(itm0);
                Py_DECREF(itm1);
                Py_DECREF(seq);
                return 0;
            }
        }

        return 1;
    }

    QList<QPair<TYPE1, TYPE2> > *ql = new QList<QPair<TYPE1, TYPE2> >;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *seq = PySequence_ITEM(sipPy, i);
        PyObject *itm0 = PySequence_ITEM(seq, 0);
        PyObject *itm1 = PySequence_ITEM(seq, 1);
        int state1, state2;

        TYPE1 *s1 = reinterpret_cast<TYPE1 *>(sipConvertToType(itm0, sipType_TYPE1, sipTransferObj, SIP_NOT_NONE, &state1, sipIsErr));
        TYPE2 *s2 = reinterpret_cast<TYPE2 *>(sipConvertToType(itm1, sipType_TYPE2, sipTransferObj, SIP_NOT_NONE, &state2, sipIsErr));
 
        Py_DECREF(itm0);
        Py_DECREF(itm1);
        Py_DECREF(seq);

        if (*sipIsErr)
        {
            sipReleaseType(s1, sipType_TYPE1, state1);
            sipReleaseType(s2, sipType_TYPE2, state2);

            delete ql;
            return 0;
        }

        ql->append(QPair<TYPE1, TYPE2>(*s1, *s2));

        sipReleaseType(s1, sipType_TYPE1, state1);
        sipReleaseType(s2, sipType_TYPE2, state2);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
// QList<QPair<int, int> > is implemented as a Python list of 2-element tuples.
%MappedType QList<QPair<int, int> > /TypeHintIn="Sequence[Tuple[int, int]]", TypeHintOut="List[Tuple[int, int]]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
#include <qpair.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        const QPair<int, int> &p = sipCpp->at(i);
        PyObject *pobj;

        if ((pobj = Py_BuildValue((char *)"ii", p.first, p.second)) == NULL)
        {
            Py_DECREF(l);

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *seq = PySequence_ITEM(sipPy, i);

            if (!seq || !PySequence_Check(seq) || PySequence_Size(seq) != 2)
            {
                Py_XDECREF(seq);
                return 0;
            }

            Py_DECREF(seq);
        }

        return 1;
    }

    QList<QPair<int, int> > *ql = new QList<QPair<int, int> >;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *seq = PySequence_ITEM(sipPy, i);
        PyObject *itm0 = PySequence_ITEM(seq, 0);
        PyObject *itm1 = PySequence_ITEM(seq, 1);

        Py_DECREF(seq);

        if (!itm0 || !itm1)
        {
            Py_XDECREF(itm0);
            Py_XDECREF(itm1);

            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        int first = SIPLong_AsLong(itm0);
        int second = SIPLong_AsLong(itm1);

        Py_DECREF(itm0);
        Py_DECREF(itm1);

        ql->append(QPair<int, int>(first, second));
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
%If (Qt_4_3_0 -)
// QList<QPair<qreal, qreal> > is implemented as a Python list of 2-element tuples.
%MappedType QList<QPair<qreal, qreal> > /TypeHintIn="Sequence[Tuple[float, float]]", TypeHintOut="List[Tuple[float, float]]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
#include <qpair.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        const QPair<qreal, qreal> &p = sipCpp->at(i);
        PyObject *pobj;

        if ((pobj = Py_BuildValue((char *)"dd", p.first, p.second)) == NULL)
        {
            Py_DECREF(l);

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *seq = PySequence_ITEM(sipPy, i);

            if (!seq || !PySequence_Check(seq) || PySequence_Size(seq) != 2)
            {
                Py_XDECREF(seq);
                return 0;
            }
        }

        return 1;
    }

    QList<QPair<qreal, qreal> > *ql = new QList<QPair<qreal, qreal> >;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *seq = PySequence_ITEM(sipPy, i);
        PyObject *itm0 = PySequence_ITEM(seq, 0);
        PyObject *itm1 = PySequence_ITEM(seq, 1);

        Py_DECREF(seq);

        if (!itm0 || !itm1)
        {
            Py_XDECREF(itm0);
            Py_XDECREF(itm1);

            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        qreal first = PyFloat_AsDouble(itm0);
        qreal second = PyFloat_AsDouble(itm1);
 
        Py_DECREF(itm0);
        Py_DECREF(itm1);

        ql->append(QPair<qreal, qreal>(first, second));
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
%End
%If (Qt_4_3_0 -)
// QList<QPair<qreal, TYPE> > is implemented as a Python list of 2-element tuples.
template<qreal, TYPE>
%MappedType QList<QPair<qreal, TYPE> > /TypeHintIn="Sequence[Tuple[float, TYPE]]", TypeHintOut="List[Tuple[float, TYPE]]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
#include <qpair.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        const QPair<qreal, TYPE> &p = sipCpp->at(i);
        TYPE *t = new TYPE(p.second);
        PyObject *pobj;

        if ((pobj = sipBuildResult(NULL, "(dN)", p.first, t, sipType_TYPE, sipTransferObj)) == NULL)
        {
            Py_DECREF(l);
            delete t;

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    SIP_SSIZE_T len;

    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
    {
        if (!PySequence_Check(sipPy) || (len = PySequence_Size(sipPy)) < 0)
            return 0;

        for (SIP_SSIZE_T i = 0; i < len; ++i)
        {
            PyObject *seq = PySequence_ITEM(sipPy, i);

            if (!seq || !PySequence_Check(seq) || PySequence_Size(seq) != 2)
            {
                Py_XDECREF(seq);
                return 0;
            }

            PyObject *itm1 = PySequence_ITEM(seq, 1);
            bool ok = (itm1 && sipCanConvertToType(itm1, sipType_TYPE, SIP_NOT_NONE));

            Py_XDECREF(itm1);
            Py_DECREF(seq);

            if (!ok)
                return 0;
        }

        return 1;
    }

    QList<QPair<qreal, TYPE> > *ql = new QList<QPair<qreal, TYPE> >;
    len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *seq = PySequence_ITEM(sipPy, i);
        PyObject *itm0 = PySequence_ITEM(seq, 0);
        PyObject *itm1 = PySequence_ITEM(seq, 1);

        Py_DECREF(seq);

        if (!itm0)
        {
            Py_DECREF(itm1);

            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        qreal d;
        int state;

        d = PyFloat_AsDouble(itm0);
        TYPE *t = reinterpret_cast<TYPE *>(sipConvertToType(itm1, sipType_TYPE, sipTransferObj, SIP_NOT_NONE, &state, sipIsErr));

        Py_DECREF(itm0);
        Py_DECREF(itm1);
 
        if (*sipIsErr)
        {
            sipReleaseType(t, sipType_TYPE, state);

            delete ql;
            return 0;
        }

        ql->append(QPair<qreal, TYPE>(d, *t));

        sipReleaseType(t, sipType_TYPE, state);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
%End
// QList<int> is implemented as a Python list of integers.
%MappedType QList<int> /TypeHintIn="Sequence[int]", TypeHintOut="List[int]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        PyObject *pobj;

        if ((pobj = SIPLong_FromLong(sipCpp->value(i))) == NULL)
        {
            Py_DECREF(l);

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);

    QList<int> *ql = new QList<int>;
    SIP_SSIZE_T len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *itm = PySequence_ITEM(sipPy, i);

        PyErr_Clear();
        long val = itm ? SIPLong_AsLong(itm) : -1;
        
        if (!itm || (val == -1 && PyErr_Occurred()))
        {
            Py_XDECREF(itm);
            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        ql->append(val);

        Py_DECREF(itm);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
// QList<unsigned> is implemented as a Python list of unsigned longs.
%MappedType QList<unsigned> /TypeHintIn="Sequence[int]", TypeHintOut="List[int]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        PyObject *pobj;

        if ((pobj = PyLong_FromUnsignedLong(sipCpp->value(i))) == NULL)
        {
            Py_DECREF(l);

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);

    QList<unsigned> *ql = new QList<unsigned>;
    SIP_SSIZE_T len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *itm = PySequence_ITEM(sipPy, i);

        PyErr_Clear();
        unsigned long val = itm ? PyLong_AsUnsignedLong(itm) : (unsigned long)-1;
        
        if (!itm || (val == (unsigned long)-1 && PyErr_Occurred()))
        {
            Py_XDECREF(itm);
            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        ql->append(val);

        Py_DECREF(itm);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
// QList<qreal> is implemented as a Python list of floats.
%MappedType QList<qreal> /TypeHintIn="Sequence[float]", TypeHintOut="List[float]", TypeHintValue="[]"/
{
%TypeHeaderCode
#include <qlist.h>
%End

%ConvertFromTypeCode
    // Create the list.
    PyObject *l;

    if ((l = PyList_New(sipCpp->size())) == NULL)
        return NULL;

    // Set the list elements.
    for (int i = 0; i < sipCpp->size(); ++i)
    {
        PyObject *pobj;

        if ((pobj = PyFloat_FromDouble(sipCpp->value(i))) == NULL)
        {
            Py_DECREF(l);

            return NULL;
        }

        PyList_SET_ITEM(l, i, pobj);
    }

    return l;
%End

%ConvertToTypeCode
    // Check the type if that is all that is required.
    if (sipIsErr == NULL)
        return (PySequence_Check(sipPy) && PySequence_Size(sipPy) >= 0);

    QList<qreal> *ql = new QList<qreal>;
    SIP_SSIZE_T len = PySequence_Size(sipPy);
 
    for (SIP_SSIZE_T i = 0; i < len; ++i)
    {
        PyObject *itm = PySequence_ITEM(sipPy, i);

        PyErr_Clear();
        double val = itm ? PyFloat_AsDouble(itm) : -1.0;
            
        if (!itm || (val == -1.0 && PyErr_Occurred()))
        {
            Py_XDECREF(itm);
            delete ql;
            *sipIsErr = 1;

            return 0;
        }

        ql->append(val);

        Py_DECREF(itm);
    }
 
    *sipCppPtr = ql;
 
    return sipGetState(sipTransferObj);
%End
};
