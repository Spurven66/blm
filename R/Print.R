#' Print
#'
#' This function prints an object
#'
#' @param model   object of class .blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return prints a very short description of the object.
#' @export


This function is what gets called if you explicitly print an object
or if you just write an expression that evaluates to an object of the class in the R terminal.
Typically it prints a very short description of the object.

For fitted objects, it customarily prints how the fitting function was called and
perhaps what the fitted coefficients were or how good the fit was.
You can check out how `lm` objects are printed to see an example.

If you want to print how the fitting function was called you need to get that
from when you fit the object in the `blm` constructor.
It is how the constructor was called that is of interest, after all.
Inside that function, you can get the way it was called by using the function `sys.call`.