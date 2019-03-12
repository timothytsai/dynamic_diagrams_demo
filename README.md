# Dynamic Diagram Demo
A flow diagram can be an effective way of communicating information about a
process.  These diagrams are sometimes specified as requirements by regulatory
agencies.

Manually creating a flow diagram is feasible, but difficult to maintain.

# Setup
This app uses the `DiagrammeR`, `dplyr`, and `DT` R packages.  Use 
`install.packages(c("shiny", "dplyr", "DT"))` to install.

# Walkthrough
We'll go over the basic structure of the app and how it works.

## Structure
The app is structured using the `app.R` format, where the app is contained in a
single file.  The UI is defined with a code block:

```
ui <- fluidPage(
...
)
```

And the server code with:
```
server <- function(input, output){
...
}
```

Finally, there is a call to `shinyApp` which creates the the app object and
returns it:
```
shinyApp(ui, server)
```

## UI

## Server