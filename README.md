Bayesian Linear Model
=====================

### A statistical toolset for performing bayesian linear analysis on data

The purpose of this package is to provide an extensive toolset of functions for diverse functionality when analysing and intepretting data in a Bayesian statistical context.

------------------------------------------------------------------------

A short outline of the functions contained in the packages:

-   blm &lt;- function(model, alpha, beta, data,...) Takes a prior distribution of model parameters and update it to a posterior distribution, based on observed data. This results in a fitted model.

-   residuals.blm = function(object,...) Calulates the difference between predicted values and observed values for the response variable.

-   deviance.blm = function(object,...) Calculates the sum of squared distances from the predicted response variables to the observed

-   print.blm = function(x, ...) Shortly describes objects of class .blm

-   summary.blm = function(object, ...) More extensive describtion of objects of class .blm

-   plot.blm = function(object,...) plots a fitted model, based on observed and fitted variables.

-   fitted.blm = function(object, ...) Calculates the fitted response variables.

-   predict.blm = function(object, newData,...) predicted values of the response variable based on a fitted model and a new set of data

-   coef.blm = function(object, ...) Extracts the coefficients from a fitted model

-   confint.blm = function(object, parm=0, level=0.95,...) confidence interval for weights

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
<td align="left">Plot():</td>
</tr>
<tr class="even">
<td align="left">A more extensive view of the fitted model is provided calling summary. The summary demonstrates the coefficients resulting from calling coef(object,..) and the sum of squared distance from observed to estimated response variable y:</td>
</tr>
<tr class="odd">
<td align="left">Summary():</td>
</tr>
<tr class="even">
<td align="left">The model can be used to predict target variables from new datasets, using the original posterior as a prior. A new dataset is introduced:</td>
</tr>
<tr class="odd">
<td align="left">x = runif(100,-10,10) y = rnorm(n = 200, m = 0, 5) newD = data.frame(y=y, x=x)</td>
</tr>
<tr class="even">
<td align="left">This allows for continuous optimization of the model as more data (under the same formula) is introduced.</td>
</tr>
</tbody>
</table>

To install the package: install.packages("blm") library(blm)

------------------------------------------------------------------------
