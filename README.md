# Dynamic Diagram Demo
A flow diagram can be an effective way of communicating information about a
process.  These diagrams are sometimes specified as requirements by regulatory
agencies (in our work, 
http://www.consort-statement.org/consort-statement/flow-diagram).

Manually creating a flow diagram is feasible, but difficult to maintain.  Any
changes to spec or updated data means that you have to open up your diagram 
(say, in Visio/Gliffy/Word) and update the text and nodes.  With a lot of
text, this could lead to errors or just a lot of hands-on work.

In this demo, we'll show how to create a flow diagram displaying text and 
summary statistics which is programmatically created.

You will still need to specify a diagram structure and process your raw data
into text pieces which will populate the diagram.  But, when your data is 
updated, the diagram will update with it.  This also means you can generate
diagrams based on user input on the fly.

# Setup
This app uses the `DiagrammeR` and `dplyr` R packages.  Use 
`install.packages(c("shiny", "dplyr", "DiagrammeR"))` to install.

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
We'll keep the UI simple for this demo.  All we need is an input dropdown for 
user input as to which chart is rendered and a space to display the diagram
output.

## Server
As usual, the server code chunk is where all the heavy lifting for the app is
done.  We will break this work down into pieces to make it easier to digest.

We need to think about our output - the diagram we want at the end.
Specifically, how many boxes in our flow chart and their relation to each other.
Also, we want to consider the content of the boxes, which we will call *labels*
(text labels such as headings) and *metrics* (numbers from a count and/or
proportions).

Once we have an idea of what we want to see, we will lay out a skeleton in the
`DiagrammeR`/`GraphViz` language.  We can render this without any content just 
to make sure the layout is as desired.

Then, we will populate the labels and text of our diagram using the processed
data from our data handling step.

Now that we have some discrete processes in our workflow, we can think about
modularizing them.  I will create two modules for this app - a layout module 
and a content module.  We'll call these two modules and merge the output to
create our final `GraphViz` code which can be passed to the `DiagrammeR`
render function.