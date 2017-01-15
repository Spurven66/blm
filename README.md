Bayesian Linear Model
=====================

### A statistical toolset for performing bayesian linear analysis on data

The purpose of this package is to provide an extensive toolset of functions for diverse functionality when analysing and intepretting dat in a Bayesian statistical context.

------------------------------------------------------------------------

A short outline of the functions contained in the packages:

\*blm &lt;- function(model, alpha, beta, data,...) Takes a prior distribution of model parameters and update it to a posterior distribution, based on observed data. This results in a fitted model.

\*residuals.blm = function(object,...) Calulates the difference between predicted values and observed values for the response variable.

\*deviance.blm = function(object,...) Calculates the sum of squared distances from the predicted response variables to the observed

\*print.blm = function(x, ...) Shortly describes objects of class .blm

\*summary.blm = function(object, ...) More extensive describtion of objects of class .blm

\*plot.blm = function(object,...) plots a fitted model, based on observed and fitted variables.

\*fitted.blm = function(object, ...) Calculates the fitted response variables.

\*predict.blm = function(object, newData,...) predicted values of the response variable based on a fitted model and a new set of data

\*coef.blm = function(object, ...) Extracts the coefficients from a fitted model

\*confint.blm = function(object, parm=0, level=0.95,...) confidence interval for weights

<table>
<colgroup>
<col width="100%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left">##Example of use Given a small dataset, D, beta = 1 and alpha = diag(1, nrow = 2, ncol = 2):</td>
</tr>
<tr class="even">
<td align="left">beta = 1.3 alpha = diag(1/a, nrow = 2, ncol = 2) w0 &lt;- 0.2 w1 &lt;- 3</td>
</tr>
<tr class="odd">
<td align="left">formula: y~x</td>
</tr>
<tr class="even">
<td align="left">x &lt;- rnorm(10) y &lt;- rnorm(10, mean = w0 + w1 * x, sd = sqrt(1/beta)) D = data.frame(y=y, x=x</td>
</tr>
<tr class="odd">
<td align="left">The fitted model is found by calling blm(y~x,alpha = alpha, beta = beta, data = D)</td>
</tr>
<tr class="even">
<td align="left">print():</td>
</tr>
<tr class="odd">
<td align="left">```r source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/blm.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Print.R&quot;)</td>
</tr>
<tr class="even">
<td align="left">x &lt;- rnorm(100) a &lt;- 1 ; b &lt;- 1.3 w0 &lt;- 0.2 ; w1 &lt;- 3 y &lt;- rnorm(100, mean = w0 + w1 * x, sd = sqrt(1/b)) covariance = diag(1/a, nrow = 2, ncol = 2) D = data.frame(y=y,x=x)</td>
</tr>
<tr class="odd">
<td align="left">fittedModel &lt;- blm(y~x, alpha = covariance, beta = b, data = D)</td>
</tr>
<tr class="even">
<td align="left">print(fittedModel) ```</td>
</tr>
<tr class="odd">
<td align="left"><code>## Bayesian Linear Model: ## y ~ x ## ## Call: ## blm(y ~ x, alpha = covariance, beta = b, data = D) ## ## Fitted coefficients (mean): ## NULL ## ## Covariance: ##               (Intercept)             x ## (Intercept)  0.0076923480 -0.0007601659 ## x           -0.0007601659  0.0098340757</code></td>
</tr>
<tr class="even">
<td align="left">Plot():</td>
</tr>
<tr class="odd">
<td align="left"><code>r source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Plot.R&quot;) #plot(fittedModel)</code></td>
</tr>
<tr class="even">
<td align="left">A more extensive view of the fitted model is provided calling summary. The summary demonstrates the coefficients resulting from calling coef(object,..) and the sum of squared distance from observed to estimated response variable y:</td>
</tr>
<tr class="odd">
<td align="left">Summary():</td>
</tr>
<tr class="even">
<td align="left"><code>r source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Summary.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Coef.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Residuals.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Deviance.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/confint.R&quot;) summary(fittedModel)</code></td>
</tr>
<tr class="odd">
<td align="left"><code>## -------Summary Of Bayesian Linear Model------- ## ## Call: ## blm(y ~ x, alpha = covariance, beta = b, data = D) ## ## ----------------------------------------------------------------------- ## Sum of squared distance: ## 0 ## ----------------------------------------------------------------------- ## ## Coefficients (mean): ##              estimate ## (Intercept) 0.1770147 ## x           3.0301329 ## ## ## Covariance Matrix, Sigma: ##               (Intercept)             x ## (Intercept)  0.0076923480 -0.0007601659 ## x           -0.0007601659  0.0098340757 ## ----------------------------------------------------------------------- ## Data[1:10,]: ##             y           x ## 1   0.3978859  0.04203019 ## 2   1.2073317  0.75095467 ## 3   1.1496627  0.12946165 ## 4   2.9753499  0.93757819 ## 5   3.6793701  0.82581518 ## 6  -0.2104166 -0.02420955 ## 7   0.8655115  0.24002048 ## 8   1.8871985  0.48471709 ## 9   3.9561474  0.87757974 ## 10  0.6420788 -0.36817960</code></td>
</tr>
<tr class="even">
<td align="left">The model can be used to predict target variables from new datasets, using the original posterior as a prior. A new dataset is introduced:</td>
</tr>
<tr class="odd">
<td align="left">x = runif(100,-10,10) y = rnorm(n = 200, m = 0, 5) newD = data.frame(y=y, x=x)</td>
</tr>
<tr class="even">
<td align="left">```r source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Fitted.R&quot;) source(&quot;C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/Predict.R&quot;)</td>
</tr>
<tr class="odd">
<td align="left">x = runif(100,-10,10) y = rnorm(n = 200, m = 0, 5) newD = data.frame(y=y, x=x)</td>
</tr>
<tr class="even">
<td align="left">predict(fittedModel, newData = newD) ```</td>
</tr>
<tr class="odd">
<td align="left"><code>##     Predicted (mean) value     Sigma ## 1               -0.5778245 0.7743994 ## 2               -0.7367330 0.7808770 ## 3               -0.1825469 0.7816996 ## 4               -0.1859759 0.7814927 ## 5               -0.2084422 0.7801990 ## 6               -0.6821802 0.7780448 ## 7               -0.7877514 0.7841014 ## 8               -0.7881212 0.7841268 ## 9               -0.2208784 0.7795293 ## 10              -0.6915249 0.7784848 ## 11              -0.2336992 0.7788735 ## 12              -0.3394068 0.7748055 ## 13              -0.3292241 0.7750934 ## 14              -0.2516299 0.7780152 ## 15              -0.4718050 0.7730797 ## 16              -0.2636358 0.7774790 ## 17              -0.4806059 0.7730978 ## 18              -0.6662397 0.7773373 ## 19              -0.5821097 0.7745033 ## 20              -0.3007899 0.7760147 ## 21              -0.5878072 0.7746474 ## 22              -0.7367927 0.7808805 ## 23              -0.1925453 0.7811032 ## 24              -0.5332501 0.7735518 ## 25              -0.1670123 0.7826686 ## 26              -0.6743660 0.7776912 ## 27              -0.3773344 0.7739282 ## 28              -0.5107648 0.7732854 ## 29              -0.7500270 0.7816636 ## 30              -0.7931455 0.7844748 ## 31              -0.4299515 0.7732202 ## 32              -0.7646447 0.7825721 ## 33              -0.5050884 0.7732353 ## 34              -0.6621864 0.7771661 ## 35              -0.3704716 0.7740641 ## 36              -0.2542278 0.7778966 ## 37              -0.5236813 0.7734253 ## 38              -0.7273665 0.7803455 ## 39              -0.1939352 0.7810220 ## 40              -0.4440372 0.7731311 ## 41              -0.5904880 0.7747177 ## 42              -0.4108456 0.7734089 ## 43              -0.5806139 0.7744666 ## 44              -0.7558812 0.7820220 ## 45              -0.1850267 0.7815497 ## 46              -0.3333867 0.7749730 ## 47              -0.1708325 0.7824255 ## 48              -0.3519388 0.7744816 ## 49              -0.2505117 0.7780667 ## 50              -0.2226916 0.7794344 ## 51              -0.6369657 0.7761796 ## 52              -0.6687910 0.7774469 ## 53              -0.4784065 0.7730917 ## 54              -0.2502806 0.7780774 ## 55              -0.5463184 0.7737563 ## 56              -0.4982433 0.7731839 ## 57              -0.4745852 0.7730837 ## 58              -0.4153332 0.7733575 ## 59              -0.5170058 0.7733485 ## 60              -0.5926535 0.7747755 ## 61              -0.7955214 0.7846413 ## 62              -0.7171723 0.7797883 ## 63              -0.3766849 0.7739406 ## 64              -0.5724393 0.7742745 ## 65              -0.3575187 0.7743482 ## 66              -0.5413087 0.7736736 ## 67              -0.1667582 0.7826849 ## 68              -0.3919496 0.7736722 ## 69              -0.4493031 0.7731087 ## 70              -0.4461383 0.7731215 ## 71              -0.2779786 0.7768787 ## 72              -0.3761436 0.7739510 ## 73              -0.3775927 0.7739232 ## 74              -0.5529079 0.7738733 ## 75              -0.1991060 0.7807235 ## 76              -0.3116765 0.7756415 ## 77              -0.7533595 0.7818667 ## 78              -0.3459344 0.7746326 ## 79              -0.4719207 0.7730799 ## 80              -0.3989991 0.7735650 ## 81              -0.3325670 0.7749964 ## 82              -0.3819357 0.7738426 ## 83              -0.1937295 0.7810340 ## 84              -0.2719657 0.7771250 ## 85              -0.7100566 0.7794126 ## 86              -0.6245878 0.7757451 ## 87              -0.3916489 0.7736770 ## 88              -0.5179339 0.7733586 ## 89              -0.7318305 0.7805965 ## 90              -0.7534702 0.7818735 ## 91              -0.7666774 0.7827021 ## 92              -0.2940796 0.7762573 ## 93              -0.7603996 0.7823036 ## 94              -0.4528589 0.7730969 ## 95              -0.6154141 0.7754443 ## 96              -0.2594605 0.7776620 ## 97              -0.4762951 0.7730869 ## 98              -0.5107666 0.7732855 ## 99              -0.2426662 0.7784357 ## 100             -0.3790080 0.7738965 ## 101             -0.5778245 0.7743994 ## 102             -0.7367330 0.7808770 ## 103             -0.1825469 0.7816996 ## 104             -0.1859759 0.7814927 ## 105             -0.2084422 0.7801990 ## 106             -0.6821802 0.7780448 ## 107             -0.7877514 0.7841014 ## 108             -0.7881212 0.7841268 ## 109             -0.2208784 0.7795293 ## 110             -0.6915249 0.7784848 ## 111             -0.2336992 0.7788735 ## 112             -0.3394068 0.7748055 ## 113             -0.3292241 0.7750934 ## 114             -0.2516299 0.7780152 ## 115             -0.4718050 0.7730797 ## 116             -0.2636358 0.7774790 ## 117             -0.4806059 0.7730978 ## 118             -0.6662397 0.7773373 ## 119             -0.5821097 0.7745033 ## 120             -0.3007899 0.7760147 ## 121             -0.5878072 0.7746474 ## 122             -0.7367927 0.7808805 ## 123             -0.1925453 0.7811032 ## 124             -0.5332501 0.7735518 ## 125             -0.1670123 0.7826686 ## 126             -0.6743660 0.7776912 ## 127             -0.3773344 0.7739282 ## 128             -0.5107648 0.7732854 ## 129             -0.7500270 0.7816636 ## 130             -0.7931455 0.7844748 ## 131             -0.4299515 0.7732202 ## 132             -0.7646447 0.7825721 ## 133             -0.5050884 0.7732353 ## 134             -0.6621864 0.7771661 ## 135             -0.3704716 0.7740641 ## 136             -0.2542278 0.7778966 ## 137             -0.5236813 0.7734253 ## 138             -0.7273665 0.7803455 ## 139             -0.1939352 0.7810220 ## 140             -0.4440372 0.7731311 ## 141             -0.5904880 0.7747177 ## 142             -0.4108456 0.7734089 ## 143             -0.5806139 0.7744666 ## 144             -0.7558812 0.7820220 ## 145             -0.1850267 0.7815497 ## 146             -0.3333867 0.7749730 ## 147             -0.1708325 0.7824255 ## 148             -0.3519388 0.7744816 ## 149             -0.2505117 0.7780667 ## 150             -0.2226916 0.7794344 ## 151             -0.6369657 0.7761796 ## 152             -0.6687910 0.7774469 ## 153             -0.4784065 0.7730917 ## 154             -0.2502806 0.7780774 ## 155             -0.5463184 0.7737563 ## 156             -0.4982433 0.7731839 ## 157             -0.4745852 0.7730837 ## 158             -0.4153332 0.7733575 ## 159             -0.5170058 0.7733485 ## 160             -0.5926535 0.7747755 ## 161             -0.7955214 0.7846413 ## 162             -0.7171723 0.7797883 ## 163             -0.3766849 0.7739406 ## 164             -0.5724393 0.7742745 ## 165             -0.3575187 0.7743482 ## 166             -0.5413087 0.7736736 ## 167             -0.1667582 0.7826849 ## 168             -0.3919496 0.7736722 ## 169             -0.4493031 0.7731087 ## 170             -0.4461383 0.7731215 ## 171             -0.2779786 0.7768787 ## 172             -0.3761436 0.7739510 ## 173             -0.3775927 0.7739232 ## 174             -0.5529079 0.7738733 ## 175             -0.1991060 0.7807235 ## 176             -0.3116765 0.7756415 ## 177             -0.7533595 0.7818667 ## 178             -0.3459344 0.7746326 ## 179             -0.4719207 0.7730799 ## 180             -0.3989991 0.7735650 ## 181             -0.3325670 0.7749964 ## 182             -0.3819357 0.7738426 ## 183             -0.1937295 0.7810340 ## 184             -0.2719657 0.7771250 ## 185             -0.7100566 0.7794126 ## 186             -0.6245878 0.7757451 ## 187             -0.3916489 0.7736770 ## 188             -0.5179339 0.7733586 ## 189             -0.7318305 0.7805965 ## 190             -0.7534702 0.7818735 ## 191             -0.7666774 0.7827021 ## 192             -0.2940796 0.7762573 ## 193             -0.7603996 0.7823036 ## 194             -0.4528589 0.7730969 ## 195             -0.6154141 0.7754443 ## 196             -0.2594605 0.7776620 ## 197             -0.4762951 0.7730869 ## 198             -0.5107666 0.7732855 ## 199             -0.2426662 0.7784357 ## 200             -0.3790080 0.7738965</code></td>
</tr>
<tr class="even">
<td align="left">This allows for continuous optimization of the model as more data (under the same formula) is introduced.</td>
</tr>
</tbody>
</table>

To install the package: install.packages("blm") library(blm)

------------------------------------------------------------------------
