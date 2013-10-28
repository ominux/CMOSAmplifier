* ee140 Spring 2013 - transistor models

.subckt nmos d g s b w=10u l=0.13u

.param cbn='(w+6u)*(l+10u)*8e-4'

m0 d g s b nmos_internal w=w l=l
csubn b 0 cbn

.model nmos_internal
+ nmos level=2 tox=2.6n vt0=0.3 gamma=0.2 phi=0.6 u0=250 ld=0.025u
+ capop=0 acm=3 ldif=65n hdif=0.13u cj=8e-4 cjsw=8e-12 cjgate=8e-11
+ lambda='0.2*exp(0.13u/l)/exp(1)'
+ VMAX=0 UEXP=0 NFS=0.1

.ends


.subckt pmos d g s b w=10u l=0.13u

.param cbp='(w+6u)*(l+10u)*8e-4'

m0 d g s b pmos_internal w=w l=l
csubp b 0 cbp

.model pmos_internal
+ pmos level=2 tox=2.6n vt0=-0.3 gamma=0.2 phi=0.6 u0=100 ld=0.025u
+ capop=0 acm=3 ldif=65n hdif=0.13u cj=8e-4 cjsw=8e-12 cjgate=8e-11
+ lambda='0.15*exp(0.13u/l)/exp(1)'
+ VMAX=0 UEXP=0 NFS=0.1

.ends

.model pnp pnp rb=300 bf=50 vaf=50 is=2e-15
.model npn npn rb=300 bf=50 vaf=50 is=2e-15
