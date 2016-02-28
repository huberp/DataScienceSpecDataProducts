##
## about metricsNames, i.e. metric names coming from inFamix Parser
##
## http://www.spinellis.gr/sw/ckjm/doc/metric.html
## https://github.com/mircealungu/Softwarenaut/tree/master/dist-base/tools/inFusion
## http://www.virtualmachinery.com/sidebar3.htm
## http://www.virtualmachinery.com/jhawkmetricsclass.htm
## https://github.com/softvis/polymetric-views
## https://www.researchgate.net/publication/273328605_An_approach_to_prioritize_code_smells_for_refactoring
##
metricsNames <- list(
  c("AMW",  "Average Method Weight", "AMW for every class. The average static complexity (in our case, McCabe's) of the methods of the measured class"),
  c("BOvR", "", ""),
  c("BUR","", ""),
  c("CPFD","", ""),
  c("CW","", ""),
  c("CBO",  "Coupling Between objects", "The coupling between object classes (CBO) metric represents the number of classes coupled to a given class (efferent couplings, Ce). This coupling can occur through method calls, field accesses, inheritance, arguments, return types, and exceptions."),
  c("DIT","Depth of Inheritance Tree", "The depth of inheritance tree (DIT) metric provides for each class a measure of the inheritance levels from the object hierarchy top. In Java where all classes inherit Object the minimum value of DIT is 1"),
  c("LCOM", "Lack of cohesion of methods", "A class's lack of cohesion in methods (LCOM) metric counts the sets of methods in a class that are not related through the sharing of some of the class's fields. The original definition of this metric (which is the one used in ckjm) considers all pairs of a class's methods. In some of these pairs both methods access at least one common field of the class, while in other pairs the two methods to not share any common field accesses. The lack of cohesion in methods is then calculated by subtracting from the number of method pairs that don't share a field access the number of method pairs that do. Note that subsequent definitions of this metric used as a measurement basis the number of disjoint graph components of the class's methods. Others modified the definition of connectedness to include calls between the methods of the class. The program ckjm follows the original (1994) definition by Chidamber and Kemerer. "),
  c("LCC","", ""),
  c("NOAM","", ""),
  c("NOACCM","", ""),
  c("NAS","", ""),
  c("NOA","Number of Attributes", "The number of attributes (instance variables/fields/members) of the class"),
  c("NOCHLD","Number of Children", "A class's number of children (NOC) metric simply measures the number of immediate descendants of the class"),
  c("NOM","Number of Methods", "The number of methods in the class"),
  c("NOVRM","", ""),
  c("NOPRTA","", ""),
  c("NOPRTM","", ""),
  c("NOPUBA","", ""),
  c("NOPUBM","Number of Public Methods", "The NPM metric simply counts all the methods in a class that are declared as public. It can be used to measure the size of an API provided by a package. "),
  c("PNAS","", ""),
  c("RFC",   "Response For Class", "The metric called the response for a class (RFC) measures the number of different methods that can be executed when an object of that class receives a message (when a method is invoked for that object). Ideally, we would want to find for each method of the class, the methods that class will call, and repeat this for each called method, calculating what is called the transitive closure of the method's call graph. This process can however be both expensive and quite inaccurate. In ckjm, we calculate a rough approximation to the response set by simply inspecting method calls within the class's method bodies. This simplification was also used in the 1994 Chidamber and Kemerer description of the metrics."),
  c("SPIDX","", ""),
  c("TCC","Tight Class Cohesion", "Tight Class Cohesion"),
  c("WOC","", "")
)

asRadioChoices <- function() {
  result <- c()
  for(m in metricsNames) {
    result <- c(result, m[1]);
    names(result)[length(result)] <- defaultText(m[2],m[1]);
  }
  result
}

getDescriptionTextByAbbrv <- function(abbrv) {
  for(m in metricsNames) {
    if(abbrv==m[1]) {
      return (defaultText(m[3],paste("Sorry no description available for",abbrv)));
    }
  }
  stop(paste("Provided Metrics Abbreviation not valid: ", abbrv))
}

getLongTextByAbbrv <- function(abbrv) {
  for(m in metricsNames) {
    if(abbrv==m[1]) {
      return (defaultText(m[2], abbrv));
    }
  }
  stop(paste("Provided Metrics Abbreviation not valid: ", abbrv))
}

defaultText <- function(prefered, default) {
  result <- prefered;
  if(0==nchar(result)) {
    result <- default;
  }
  result;
}