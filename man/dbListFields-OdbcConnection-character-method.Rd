% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Connection.R
\name{dbListFields,OdbcConnection,character-method}
\alias{dbListFields,OdbcConnection,character-method}
\alias{dbListFields}
\title{List field names of a remote table}
\usage{
\S4method{dbListFields}{OdbcConnection,character}(
  conn,
  name,
  catalog_name = NULL,
  schema_name = NULL,
  column_name = NULL,
  ...
)
}
\arguments{
\item{conn}{A \linkS4class{DBIConnection} object, as returned by
\code{\link[DBI:dbConnect]{dbConnect()}}.}

\item{name}{The table name, passed on to \code{\link[DBI:dbQuoteIdentifier]{dbQuoteIdentifier()}}. Options are:
\itemize{
\item a character string with the unquoted DBMS table name,
e.g. \code{"table_name"},
\item a call to \code{\link[DBI:Id]{Id()}} with components to the fully qualified table name,
e.g. \code{Id(schema = "my_schema", table = "table_name")}
\item a call to \code{\link[DBI:SQL]{SQL()}} with the quoted and fully qualified table name
given verbatim, e.g. \code{SQL('"my_schema"."table_name"')}
}}

\item{catalog_name}{The name of the catalog to return, the default returns all catalogs.}

\item{schema_name}{The name of the schema to return, the default returns all schemas.}

\item{column_name}{The name of the column to return, the default returns all columns.}

\item{...}{Other parameters passed on to methods.}
}
\value{
\code{dbListFields()}
returns a character vector
that enumerates all fields
in the table in the correct order.
This also works for temporary tables if supported by the database.
The returned names are suitable for quoting with \code{dbQuoteIdentifier()}.
}
\description{
Returns the field names of a remote table as a character vector.

\Sexpr[results=rd,stage=render]{DBI:::methods_as_rd("dbListFields")}
}
\details{
\code{\%} can be used as a wildcard in any of the search parameters to
match 0 or more characters. \verb{_} can be used to match any single character.
}
\section{Failure modes}{



If the table does not exist, an error is raised.
Invalid types for the \code{name} argument
(e.g., \code{character} of length not equal to one,
or numeric)
lead to an error.
An error is also raised when calling this method for a closed
or invalid connection.


}

\section{Specification}{




The \code{name} argument can be
\itemize{
\item a string
\item the return value of \code{\link[DBI:dbQuoteIdentifier]{dbQuoteIdentifier()}}
\item a value from the \code{table} column from the return value of
\code{\link[DBI:dbListObjects]{dbListObjects()}} where \code{is_prefix} is \code{FALSE}
}

A column named \code{row_names} is treated like any other column.


}

\examples{
con <- dbConnect(RSQLite::SQLite(), ":memory:")

dbWriteTable(con, "mtcars", mtcars)
dbListFields(con, "mtcars")

dbDisconnect(con)
}
\seealso{
\code{\link[DBI:dbColumnInfo]{dbColumnInfo()}} to get the type of the fields.

Other DBIConnection generics: 
\code{\link[DBI]{DBIConnection-class}},
\code{\link[DBI]{dbAppendTable}()},
\code{\link[DBI]{dbCreateTable}()},
\code{\link[DBI]{dbDataType}()},
\code{\link[DBI]{dbDisconnect}()},
\code{\link[DBI]{dbExecute}()},
\code{\link[DBI]{dbExistsTable}()},
\code{\link[DBI]{dbGetException}()},
\code{\link[DBI]{dbGetInfo}()},
\code{\link[DBI]{dbGetQuery}()},
\code{\link[DBI]{dbIsReadOnly}()},
\code{\link[DBI]{dbIsValid}()},
\code{\link[DBI]{dbListObjects}()},
\code{\link[DBI]{dbListResults}()},
\code{\link[DBI]{dbListTables}()},
\code{\link[DBI]{dbReadTable}()},
\code{\link[DBI]{dbRemoveTable}()},
\code{\link[DBI]{dbSendQuery}()},
\code{\link[DBI]{dbSendStatement}()},
\code{\link[DBI]{dbWriteTable}()}
}
