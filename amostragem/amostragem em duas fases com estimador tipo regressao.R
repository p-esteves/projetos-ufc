#exercício de amostragem em duas fases com estimador do tipo regresssão
#

#dados e medidas
x_s = c(5,9,18,68,32,48,11,1,1,4,29,31,5,2,4,102,20,15,1,29)
y= c(3,5,5,52,21,34,3,0,0,0,17,14,0,0,2,54,11,11,0,23)
x_s_barra = mean(x_s)
x_s_a_barra = 6786/270

#1. ybarra = mean(y)
#
ybarra = mean(y)

#2. y_reg = ybarra - p_est*x_s_barra + p_est*x_s_a_barra
#
sxy = round(cov(x_s, y),4)
sx2 = round(var(x_s),4)
p_est = round(sxy/sx2,4)
y_reg = round(ybarra - p_est*x_s_barra + p_est*x_s_a_barra,4)

#3. y_rz = ybarra*(x_s_a_barra/x_s_barra)
#
y_rz = round(ybarra*(x_s_a_barra/x_s_barra), 4)

#4. comparar variância
# v(y_reg) = sy^2(1- ryx^2)/n_s + (ryx^2 sy^2)/n_s_a
# v(y_rz) = 1/n_s [sy^2 + r^2sx^2 - 2rsyx] + (2rsyx - r^2sx^2) /n_sa
#
var_ybarra = var(y)
sy2 = round(var(y),4)
ryx2 = round(((sxy)^2)/(sx2*sy2),4)
var_y_reg = ((sy2*(1-ryx2))/20) + ((ryx2*sy2)/270)
r = (ybarra/x_s_barra)
r2 = r^2
var_y_rz = (1/20)*(sy2+ r2*sx2 - 2*r*sxy) + (((2*r*sxy) - (r2*sx2))/270)