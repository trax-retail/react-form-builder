###* @jsx React.DOM ###

React = require('react')
ReactBootstrap = require('react-bootstrap')

MarkdownHelpButton = React.createClass(
  openModal: ->
    page = window.open("", "Markdown help", "_blank")
    page.document.write(
      """
        <!DOCTYPE html>
        <html>
          <head>
            <title>Markdown Help</title>
            <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
          </head>
          <body>
            <pre>
              Markdown Help
              -------------

              For detailed and extended information <a href="http://daringfireball.net/projects/markdown/syntax" target="_blank">click here</a>

              # Header 1 #
              ## Header 2 ##
              ### Header 3 ###             (Hashes on right are optional)
              #### Header 4 ####
              ##### Header 5 #####

              ## Markdown plus h2 with a custom ID ##
              [Link back to H2](#id-goes-here)

              This is a paragraph, which is text surrounded by whitespace. Paragraphs can be on one
              line (or many), and can drone on for hours.

              Here is a Markdown link to [Warped](http://warpedvisions.org), and a literal .
              Now some SimpleLinks, like one to [google] (automagically links to are-you-
              feeling-lucky), a [wiki: test] link to a Wikipedia page, and a link to
              [foldoc: CPU]s at foldoc.

              Now some inline markup like _italics_,  **bold**, and code(). Note that underscores in
              words are ignored in Markdown Extra.

              ![picture alt](/images/photo.jpeg "Title is optional")

              &gt; Blockquotes are like quoted text in email replies
              &gt; And, they can be nested

              * Bullet lists are easy too
              - Another one
              + Another one

              1. A numbered list
              2. Which is numbered
              3. With periods and a space

              And now some code:

                  // Code is just text indented a bit
                  which(is_easy) to_remember();

              ~~~

              // Markdown extra adds un-indented code blocks too


              ~~~

              Text with
              two trailing spaces
              (on the right)
              can be used
              for things like poems

              ### Horizontal rules

              * * * *
              ****
              --------------------------

              &lt;div class="custom-class" markdown="1"&gt;
              This is a div wrapping some Markdown plus.  Without the DIV attribute, it ignores the
              block.
              &lt;/div&gt;

              ## Markdown plus tables ##

              | Header | Header | Right  |
              | ------ | ------ | -----: |
              |  Cell  |  Cell  |   $10  |
              |  Cell  |  Cell  |   $20  |

              * Outer pipes on tables are optional
              * Colon used for alignment (right versus left)

              ## Markdown plus definition lists ##

              Bottled water
              : $ 1.25
              : $ 1.55 (Large)

              Milk
              Pop
              : $ 1.75

              * Multiple definitions and terms are possible
              * Definitions can include multiple paragraphs too

              *[ABBR]: Markdown plus abbreviations (produces an &lt;abbr&gt; tag)
            </pre>
          </body>
        </html>
      """
    )

  render: ->
    `(
      <ReactBootstrap.Button className="btn-xs btn-gradient" onClick={this.openModal}>
        <ReactBootstrap.Glyphicon glyph="question" />
      </ReactBootstrap.Button>
    )`
)

module.exports = MarkdownHelpButton