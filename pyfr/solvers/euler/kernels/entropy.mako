<%namespace module='pyfr.backends.base.makoutil' name='pyfr'/>

<%pyfr:macro name='compute_entropy' params='u, d, p, e, vb'>
    d = u[0];
    fpdtype_t rcpd = 1.0/d;
    fpdtype_t E = u[${nvars - 1}];

    // Compute the pressure
    fpdtype_t rote = 0.5*d*(vb[0]*vb[0] + vb[1]*vb[1]);
    p = ${c['gamma'] - 1}*(E - 0.5*rcpd*(${pyfr.dot('u[{i}]', i=(1, ndims + 1))}));

    // Compute specific physical entropy
    e = (d > 0 && p > 0) ? p*pow(rcpd, ${c['gamma']}) : ${fpdtype_max};
</%pyfr:macro>
