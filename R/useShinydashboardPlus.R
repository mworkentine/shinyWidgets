#' Use 'shinydashboardPlus' in 'shiny'
#'
#' Allow to use functions from 'shinydashboardPlus' into a classic 'shiny' app.
#'
#' @export
#'
#' @importFrom htmltools findDependencies attachDependencies
#'
#' @examples
#' if (interactive()) {
#'
#' library(shiny)
#' library(shinydashboard)
#' library(shinydashboardPlus)
#' library(shinyWidgets)
#'
#'
#' # example taken from ?box
#'
#' ui <- fluidPage(
#'   tags$h2("Classic shiny"),
#'
#'   # use this in non shinydashboardPlus app
#'   useShinydashboardPlus(),
#'   setBackgroundColor(color = "ghostwhite"),
#'
#'   # boxPlus
#'   fluidRow(
#'    boxPlus(
#'      title = "Closable Box with dropdown",
#'      closable = TRUE,
#'      status = "warning",
#'      solidHeader = FALSE,
#'      collapsible = TRUE,
#'      enable_dropdown = TRUE,
#'      dropdown_icon = "wrench",
#'      dropdown_menu = dropdownItemList(
#'        dropdownItem(url = "http://www.google.com", name = "Link to google"),
#'        dropdownItem(url = "#", name = "item 2"),
#'        dropdownDivider(),
#'        dropdownItem(url = "#", name = "item 3")
#'      ),
#'      p("Box Content")
#'    ),
#'    boxPlus(
#'      title = "Closable box, with label",
#'      closable = TRUE,
#'      enable_label = TRUE,
#'      label_text = 1,
#'      label_status = "danger",
#'      status = "warning",
#'      solidHeader = FALSE,
#'      collapsible = TRUE,
#'      p("Box Content")
#'    )
#'   ),
#'
#'   br(),
#'
#'   # gradientBoxes
#'   fluidRow(
#'     gradientBox(
#'      title = "My gradient Box",
#'      icon = "fa fa-th",
#'      gradientColor = "teal",
#'      boxToolSize = "sm",
#'      footer = column(
#'        width = 12,
#'        align = "center",
#'        sliderInput(
#'          "obs",
#'          "Number of observations:",
#'          min = 0, max = 1000, value = 500
#'        )
#'      ),
#'      plotOutput("distPlot")
#'     ),
#'     gradientBox(
#'      title = "My gradient Box",
#'      icon = "fa fa-heart",
#'      gradientColor = "maroon",
#'      boxToolSize = "xs",
#'      closable = TRUE,
#'      footer = "The footer goes here. You can include anything",
#'      "This is a gradient box"
#'     )
#'   ),
#'
#'   br(),
#'
#'   # extra elements
#'   fluidRow(
#'   column(
#'    width = 6,
#'    timelineBlock(
#'      reversed = FALSE,
#'      timelineEnd(color = "danger"),
#'      timelineLabel(2018, color = "teal"),
#'      timelineItem(
#'        title = "Item 1",
#'        icon = "gears",
#'        color = "olive",
#'        time = "now",
#'        footer = "Here is the footer",
#'        "This is the body"
#'      ),
#'      timelineItem(
#'        title = "Item 2",
#'        border = FALSE
#'      ),
#'      timelineLabel(2015, color = "orange"),
#'      timelineItem(
#'        title = "Item 3",
#'        icon = "paint-brush",
#'        color = "maroon",
#'        timelineItemMedia(src = "http://placehold.it/150x100"),
#'        timelineItemMedia(src = "http://placehold.it/150x100")
#'      ),
#'      timelineStart(color = "gray")
#'     )
#'    ),
#'   column(
#'    width = 6,
#'    box(
#'      title = "Box with boxPad containing inputs",
#'      status = "warning",
#'      width = 12,
#'      fluidRow(
#'        column(
#'          width = 6,
#'          boxPad(
#'            color = "gray",
#'            sliderInput(
#'              "obs2",
#'              "Number of observations:",
#'              min = 0, max = 1000, value = 500
#'            ),
#'            checkboxGroupInput(
#'              "variable",
#'              "Variables to show:",
#'              c(
#'                "Cylinders" = "cyl",
#'                "Transmission" = "am",
#'                "Gears" = "gear"
#'              )
#'            ),
#'
#'            knobInput(
#'              inputId = "myKnob",
#'              skin = "tron",
#'              readOnly = TRUE,
#'              label = "Display previous:",
#'              value = 50,
#'              min = -100,
#'              displayPrevious = TRUE,
#'              fgColor = "#428BCA",
#'              inputColor = "#428BCA"
#'            )
#'          )
#'        ),
#'        column(
#'          width = 6,
#'          plotOutput("distPlot2", height = "200px"),
#'          tableOutput("data")
#'        )
#'      )
#'     )
#'    )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'
#'   output$distPlot <- renderPlot({
#'    hist(rnorm(input$obs))
#'   })
#'
#'   output$distPlot2 <- renderPlot({
#'     hist(rnorm(input$obs2))
#'   })
#'
#'   output$data <- renderTable({
#'     head(mtcars[, c("mpg", input$variable), drop = FALSE])
#'   }, rownames = TRUE)
#'
#' }
#'
#' shinyApp(ui, server)
#'
#' }
useShinydashboardPlus <- function() {
  if (!requireNamespace(package = "shinydashboardPlus"))
    message("Package 'shinydashboardPlus' is required to run this function")
  deps <- findDependencies(shinydashboardPlus::dashboardPagePlus(
    header = shinydashboardPlus::dashboardHeaderPlus(),
    sidebar = shinydashboard::dashboardSidebar(),
    body = shinydashboard::dashboardBody()
  ))
  attachDependencies(tags$div(class = "main-sidebar", style = "display: none;"), value = deps)
}

