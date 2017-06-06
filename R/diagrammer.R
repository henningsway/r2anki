## testing DiagrammeR
library(DiagrammeR)

graph <- open_graph(system.file("extdata/example_graphs_dgr/repository.dgr",
                                package = "DiagrammeR"))

render_graph(graph, layout = "kk")


m1 <- mermaid("
graph LR
              A[r]-->B
              B[2]-.->A
              B-->C
              C[anki]-.->B
              ")

DiagrammeR("
graph LR
A(Rounded)-->B[Squared]
B-->C{A Decision}
C-->D[Square One]
C-->E[Square Two]

           style A fill:#E5E25F;  style B fill:#87AB51; style C fill:#3C8937;
           style D fill:#23772C;  style E fill:#B6E6E6;"
)


mermaid("
classDiagram
    Class01 <|-- AveryLongClass : Cool
        Class03 *-- Class04
        Class05 o-- Class06
        Class07 .. Class08
        Class09 --> C2 : Where am i?
        Class09 --* C3
        Class09 --|> Class07
        Class07 : equals()
        Class07 : Object[] elementData
        Class01 : size()
        Class01 : int chimp
        Class01 : int gorilla
        Class08 <--> C2: Cool label        ")

DiagrammeR("
sequenceDiagram;
   customer->>ticket seller: ask for a ticket;
   ticket seller->>database: seats;
   alt tickets available
     database->>ticket seller: ok;
     ticket seller->>customer: confirm;
     customer->>ticket seller: ok;
     ticket seller->>database: book a seat;
     ticket seller->>printer: print a ticket;
   else sold out
     database->>ticket seller: none left;
     ticket seller->>customer: sorry;
   end
")
