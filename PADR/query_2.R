#--------------------------------scieĹĽki - Marika ----------------
fitness<-"C:/Users/hp/Desktop/STUDIA/PAD-R/pd3_PADR_PADPy/serwisy_csv/fitness_stackexchange_com"
interpersonal<-"C:/Users/hp/Desktop/STUDIA/PAD-R/pd3_PADR_PADPy/serwisy_csv/interpersonal_stackexchange_com"
worldbuilding<-"C:/Users/hp/Desktop/STUDIA/PAD-R/pd3_PADR_PADPy/serwisy_csv/worldbuilding_stackexchange_com"

#------------scieżki - Agata

fitness<-"C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/serwisy_csv/fitness_stackexchange_com"
interpersonal<-"C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/serwisy_csv/interpersonal_stackexchange_com"
worldbuilding<-"C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/serwisy_csv/worldbuilding_stackexchange_com"

#---------Posts-------------------------------

PostsF<-read.csv(paste(fitness, "/Posts.csv", sep=""), header=TRUE, stringsAsFactors = FALSE)
PostsI<-read.csv(paste(interpersonal, "/Posts.csv", sep=""), header=TRUE)
PostsW<-read.csv(paste(worldbuilding, "/Posts.csv", sep=""), header=TRUE)


#-------------Posty ktĂłry miaĹy‚ najwiecej wyswietlen w Fitnessie(hehe)


TopViewsPostF<-PostsF%>%arrange(desc(ViewCount))%>%
  select(Id, PostTypeId, AcceptedAnswerId, CreationDate, ViewCount, Body, Title, CommentCount, OwnerUserId)

write.csv(TopViewsPostF%>%
            top_n(15, ViewCount), file = "C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/PADR/dane_posrednie/q2/TopViewsPostF.csv", row.names = FALSE)

TopViewsPostF%>%
  top_n(15, ViewCount) %>%
  mutate(Title = reorder(Title, ViewCount)) %>%
  ggplot() + aes(x=Title, y=ViewCount) +
  geom_bar(stat="identity", fill="magenta4") +
  coord_flip() +
  labs(title = "Najpopularniejsze posty wed�ug liczby ods�on",
       y = "Liczba ods�on", x = "") +
  theme(axis.text = element_text(size = 16))

#-------------Post ktĂłry miaĹ‚ najwiecej wyswietlen w Interpersonal

TopViewsPostI<-PostsI%>%arrange(desc(ViewCount))%>%
  select(Id, PostTypeId, AcceptedAnswerId, CreationDate, ViewCount, Body, Title, CommentCount, Tags)

write.csv(TopViewsPostI%>%
            top_n(15, ViewCount), file = "C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/PADR/dane_posrednie/q2/TopViewsPostI.csv", row.names = FALSE)

TopViewsPostI%>%
  top_n(15, ViewCount) %>%
  mutate(Title = reorder(Title, ViewCount)) %>%
  ggplot() + aes(x=Title, y=ViewCount) +
  geom_bar(stat="identity", fill="turquoise4") +
  coord_flip() +
  labs(title = "Najpopularniejsze posty wed�ug liczby ods�on",
       y = "Liczba ods�on", x = "") +
  theme(axis.text = element_text(size = 16))


#--------------Posty które miały njawiecej wyswietlen w Worldbuilding

TopViewsPostW<-PostsW%>%arrange(desc(ViewCount))%>%
  select(Id, PostTypeId, AcceptedAnswerId, CreationDate, ViewCount, Body, Title, CommentCount, Tags)

write.csv(TopViewsPostW%>%
            top_n(15, ViewCount), file = "C:/Users/aga71/OneDrive/studia/SEMESTRY/MGR/I/inne/pd3_PADR_PADPy/PADR/dane_posrednie/q2/TopViewsPostW.csv", row.names = FALSE)

TopViewsPostW%>%
  top_n(15, ViewCount) %>%
  mutate(Title = reorder(Title, ViewCount)) %>%
  ggplot() + aes(x=Title, y=ViewCount) +
  geom_bar(stat="identity", fill="seagreen4") +
  coord_flip() +
  labs(title = "Najpopularniejsze posty wed�ug liczby ods�on",
       y = "Liczba ods�on", x = "") +
  theme(axis.text = element_text(size = 16))
