##' convert plot to ggplot object
##'
##'
##' @title as.ggplot
##' @param plot base or grid plot, or graphic generated by ggplot, lattice, etc.
##' @importFrom ggplot2 ggplot
##' @importFrom ggplot2 aes_
##' @importFrom ggplot2 geom_blank
##' @importFrom ggplot2 annotation_custom
##' @importFrom ggplot2 theme_void
##' @return ggplot object
##' @export
##' @examples
##' as.ggplot(~barplot(1:10))
##' @author Guangchuang Yu
as.ggplot <- function(plot, envir = environment()) {
    ## plot_expr <- quo_name(enexpr(plot))
    ## if (is.null(plot)) {
    ##     plot <- as.grob(plot_expr)
    ## }

    ggplot(data.frame(x = 0:1, y = 0:1), aes_(x = ~x, y = ~y)) +
        geom_blank() +
        annotation_custom(as.grob(plot, envir),
                          xmin = -Inf, xmax = Inf,
                          ymin = -Inf, ymax = Inf) +
        theme_void()
}

