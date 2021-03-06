#---------------------------------------------------------------------------------------------------
#
# Skrypt do generowania plik�w *.csv z plik�w *.xml
#
#---------------------------------------------------------------------------------------------------

## �cie�ki do plik�w

# Agata
root <- "C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/"

# Marika
# root <- ""

#---------------------------------------------------------------------------------------------------

## Funkcja tworz�ca plik file_name.csv z pliku file_name.xml znajduj�cego si� w katalogu catalog

xml_to_csv <- function(catalog, file_name){
  root_xml <- paste(root, "serwisy_xml/", catalog, "/", file_name, ".xml", sep = "")
  table_xml <- xmlParse(root_xml)
  df <- XML:::xmlAttrsToDataFrame(getNodeSet(table_xml, path='//row'))
  root_csv <- paste(root, "serwisy_csv/", catalog, "/", file_name, ".csv", sep = "")
  write.csv(df, file = root_csv, row.names = FALSE)
}

#---------------------------------------------------------------------------------------------------

## Nazwy plik�w

file_names <- c("Badges", "Comments", "PostHistory", "PostLinks", "Posts", "Tags", "Users", "Votes")

#---------------------------------------------------------------------------------------------------

## Konwersja plik�w *.xml na *.csv

sapply(file_names, function(x) {xml_to_csv("fitness_stackexchange_com", x)})
sapply(file_names, function(x) {xml_to_csv("interpersonal_stackexchange_com", x)})
sapply(file_names, function(x) {xml_to_csv("worldbuilding_stackexchange_com", x)})
