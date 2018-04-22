
# coding: utf-8

# In[3]:



get_ipython().run_line_magic('matplotlib', 'inline')

import scipy as sp
from scipy import signal
import numpy as np
import matplotlib
import matplotlib.pyplot as plt

matplotlib.rcParams['figure.figsize'] = (16.0, 12.0)
matplotlib.style.use('ggplot')



# ## Интегрирующее звено
# 
# $$ W(s) = \frac{K}{s}$$

# In[27]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[1, 0])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Интегрирующего звена')


# In[28]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Интегральная шаг\имп')


# ## Дифференцирующее звено
# 
# 
# $$ W(s) = Ks$$

# In[39]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i, 0],[0,1])
    #step.append(signal.step(s))
    #impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Дифференцирующего звена')


# ## Усилительное звено
# 
# 
# $$ W(s) = K $$

# In[42]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Усилительного звена')


# In[43]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Усилительное step\imp')


# ## Апериодическое звено 1-го порядка
# 
# $$ W(S) = \frac{K}{Ts + 1} $$

# In[46]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 0.5

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[T, 1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 0.5');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 0.5')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Апериодическое 05')


# In[47]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Апериодическое step\imp')


# ## Апериодическое звено 2-ого порядка
# 
# $T_1 > 2T_2$
# 
# $$ W(s) = \frac{K}{T_2^2s^2 + T_1s + 1} $$

# In[48]:


T1 = 10
T2 = 4

t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];


w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[T2**2,T1, 1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T1 = 10, T2 = 4');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T1 = 10, T2 = 4')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Апериодическое2')


# In[49]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Апериодическое2 step\imp')


# ## Колебательное звено
# 
# $T_1  < 2T_2$
# 
# $$ W(s) = \frac{K}{T_2^2s^2 + T_1s + 1} $$

# In[55]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T1 = 4
T2 = 5

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[T2**2,T1, 1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T1 = 4, T2 = 5');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T1 = 4, T2 = 5')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Колебательное')


# In[56]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Колебательное step\imp')


# ## Консервативное звено
# 
# $$ W(s) = \frac{K}{Ts^2 + 1}  $$

# In[57]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 3

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];

for i in K:
    s = signal.lti([i],[T,0, 1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 3');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 3')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Консервативное')


# In[58]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Консервативное step\imp')


# ## Реальное интегрирующее звено
# 
# 
# 
# $$ W(s) = \frac{K}{Ts^2 + s} $$

# In[59]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 3

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i],[T, 1,0])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 3');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 3')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Интегрирующее с запазданием')


# In[60]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Реальное интегрирующее step\imp')


# ## Реальное дифференцирующее звено
# 
# 
# 
# $$ W(s) = \frac{Ks}{Ts + 1} $$

# In[61]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 3

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i, 0],[T, 1])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 3');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 3')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Дифференцирующее с запазданием')


# In[62]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Реальное дифференцирующее step\imp')


# ## Форсирующее звено
# 
# 
# 
# $$ W(s) = K(Ts+1) $$

# In[64]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 3

w_list = [];
mag_list = [];
phase_list = [];
#step = [];
#impulse = [];


for i in K:
    s = signal.lti([i*T, i],[1])
    #step.append(signal.step(s))
    #impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 3');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 3')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Форсирующее')


# ## Изодромное звено
# 
# 
# $$ W(s) = \frac{K(Ts+1)}{s} $$

# In[65]:


t = np.arange(0,25,0.01);
K = [0.01, 0.1, 1, 5, 10, 15];
T = 3

w_list = [];
mag_list = [];
phase_list = [];
step = [];
impulse = [];


for i in K:
    s = signal.lti([i*T, i],[1,0])
    step.append(signal.step(s))
    impulse.append(signal.impulse(s))
    w, mag, phase = signal.bode(s)
    w_list.append(w);
    mag_list.append(mag);
    phase_list.append(phase);
    
plt.subplot(1,2,1)
plt.semilogx(w_list[0],mag_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],mag_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],mag_list[2], label = 'K = 1')
plt.semilogx(w_list[3],mag_list[3], label = 'K = 5')
plt.semilogx(w_list[4],mag_list[4], label = 'K = 10')
plt.semilogx(w_list[5],mag_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode magnitude plot, T = 3');
plt.xlabel('$\omega$')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.semilogx(w_list[0],phase_list[0], label = 'K = 0.01')
plt.semilogx(w_list[1],phase_list[1], label = 'K = 0.1')
plt.semilogx(w_list[2],phase_list[2], label = 'K = 1')
plt.semilogx(w_list[3],phase_list[3], label = 'K = 5')
plt.semilogx(w_list[4],phase_list[4], label = 'K = 10')
plt.semilogx(w_list[5],phase_list[5], label = 'K = 15')
plt.legend( loc = 1)
plt.title('Bode phase plot, T = 3')
plt.xlabel('$\omega$')
plt.ylabel('Phase')

plt.savefig('ПФ Изодромное')


# In[66]:


plt.subplot(1,2,1)
plt.plot(step[0][0], step[0][1], label = 'K = 0.01')
plt.plot(step[1][0], step[1][1], label = 'K = 0.1')
plt.plot(step[2][0], step[2][1], label = 'K = 1')
plt.plot(step[3][0], step[3][1], label = 'K = 5')
plt.plot(step[4][0], step[4][1], label = 'K = 10')
plt.plot(step[5][0], step[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) step-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.subplot(1,2,2)
plt.plot(impulse[0][0], impulse[0][1], label = 'K = 0.01')
plt.plot(impulse[1][0], impulse[1][1], label = 'K = 0.1')
plt.plot(impulse[2][0], impulse[2][1], label = 'K = 1')
plt.plot(impulse[3][0], impulse[3][1], label = 'K = 5')
plt.plot(impulse[4][0], impulse[4][1], label = 'K = 10')
plt.plot(impulse[5][0], impulse[5][1], label = 'K = 15')
plt.legend(loc = 1)
plt.title('signal.lti(...) imp-time')
plt.xlabel('t')
plt.ylabel('Magnitude')

plt.savefig('ПФ Изодромное step\imp')

